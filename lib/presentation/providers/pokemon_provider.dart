import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_2025/domain/domain.dart';
import 'pokemons_repository_provider.dart';

class PokemonNotifier extends Notifier<AsyncValue<List<Pokemon>>> {
  late final PokemonsRepository _repository;
  bool _isLoadingMore = false;

  @override
  AsyncValue<List<Pokemon>> build() {
    _repository = ref.read(pokemonsRepositoryProvider);
    return const AsyncValue.loading();
  }

  Future<void> loadPokemons({int limit = 20, int offset = 0}) async {
    state = const AsyncValue.loading();
    
    try {
      final pokemons = await _repository.getPokemons(limit: limit, offset: offset);
      state = AsyncValue.data(pokemons);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> loadMorePokemons({int limit = 20}) async {
    if (state.hasValue && !_isLoadingMore) {
      _isLoadingMore = true;
      final currentPokemons = state.value!;
      final offset = currentPokemons.length;
      
      try {
        final newPokemons = await _repository.getPokemons(limit: limit, offset: offset);
        if (newPokemons.isNotEmpty) {
          // Filtrar duplicados basándose en el order del Pokémon
          final existingOrders = currentPokemons.map((p) => p.order).toSet();
          final uniqueNewPokemons = newPokemons.where((p) => !existingOrders.contains(p.order)).toList();
          
          if (uniqueNewPokemons.isNotEmpty) {
            final allPokemons = [...currentPokemons, ...uniqueNewPokemons];
            state = AsyncValue.data(allPokemons);
          }
        }
      } catch (error) {
        // Silently handle error for load more operation
      } finally {
        _isLoadingMore = false;
      }
    }
  }

  Future<void> searchPokemon(String name) async {
    state = const AsyncValue.loading();
    
    try {
      // Primero buscar en la lista actual de Pokémon
      if (state.hasValue) {
        final currentPokemons = state.value!;
        final foundPokemon = currentPokemons.where((pokemon) => 
          pokemon.name.toLowerCase().contains(name.toLowerCase())
        ).toList();
        
        if (foundPokemon.isNotEmpty) {
          state = AsyncValue.data(foundPokemon);
          return;
        }
      }
      
      // Si no se encuentra en la lista actual, buscar por nombre exacto usando el endpoint
      final pokemon = await _repository.getPokemonByName(name);
      state = AsyncValue.data([pokemon]);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> filterPokemonsByTypes(Set<String> selectedTypes) async {
    if (selectedTypes.isEmpty) {
      // Si no hay filtros, cargar lista normal
      await loadPokemons();
      return;
    }

    state = const AsyncValue.loading();
    
    try {
      // Cargar todos los Pokémon primero
      final allPokemons = await _repository.getPokemons(limit: 1000, offset: 0);
      
      // Filtrar por tipos seleccionados
      final filteredPokemons = allPokemons.where((pokemon) {
        
        final hasMatchingType = pokemon.types.any((type) => selectedTypes.contains(type));
        
        return hasMatchingType;
      }).toList();
      
      state = AsyncValue.data(filteredPokemons);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void clearPokemons() {
    state = const AsyncValue.data([]);
  }

  void refresh() {
    loadPokemons();
  }

  bool get isLoadingMore => _isLoadingMore;
}

final pokemonProvider = NotifierProvider<PokemonNotifier, AsyncValue<List<Pokemon>>>(() {
  return PokemonNotifier();
});
