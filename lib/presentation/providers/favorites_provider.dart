import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_2025/infrastructure/services/favorites_storage_service.dart';

class FavoritesNotifier extends AsyncNotifier<Set<int>> {
  @override
  Future<Set<int>> build() async {
    // Cargar favoritos desde SharedPreferences al inicializar
    return await _loadFavorites();
  }

  // Cargar favoritos desde SharedPreferences
  Future<Set<int>> _loadFavorites() async {
    try {
      final favorites = await FavoritesStorageService.loadFavorites();
      return favorites.toSet();
    } catch (e) {
      // Si hay error, retornar estado vacío
      return <int>{};
    }
  }

  // Guardar favoritos en SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final currentState = state.value ?? <int>{};
      await FavoritesStorageService.saveFavorites(currentState.toList());
    } catch (e) {
      // Manejar error de guardado si es necesario
    }
  }

  void toggleFavorite(int pokemonOrder) {
    final currentFavorites = state.value ?? <int>{};
    Set<int> newFavorites;
    
    if (currentFavorites.contains(pokemonOrder)) {
      // Remover de favoritos
      newFavorites = Set.from(currentFavorites)..remove(pokemonOrder);
    } else {
      // Agregar a favoritos
      newFavorites = Set.from(currentFavorites)..add(pokemonOrder);
    }
    
    // Actualizar estado
    state = AsyncValue.data(newFavorites);
    
    // Guardar cambios en SharedPreferences
    _saveFavorites();
  }

  bool isFavorite(int pokemonOrder) {
    return state.value?.contains(pokemonOrder) ?? false;
  }

  // Método para limpiar todos los favoritos
  Future<void> clearAllFavorites() async {
    state = const AsyncValue.data(<int>{});
    await FavoritesStorageService.clearFavorites();
  }
}

final favoritesProvider = AsyncNotifierProvider<FavoritesNotifier, Set<int>>(() {
  return FavoritesNotifier();
});
