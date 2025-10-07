import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorageService {
  static const String _favoritesKey = 'pokemon_favorites';

  // Guardar lista de favoritos
  static Future<void> saveFavorites(List<int> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesStringList = favorites.map((id) => id.toString()).toList();
    await prefs.setStringList(_favoritesKey, favoritesStringList);
  }

  // Cargar lista de favoritos
  static Future<List<int>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesStringList = prefs.getStringList(_favoritesKey) ?? [];
    return favoritesStringList.map((id) => int.parse(id)).toList();
  }

  // Limpiar todos los favoritos
  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
}
