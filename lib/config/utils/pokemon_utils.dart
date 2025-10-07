import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/constants/assets.dart' as assets;

class PokemonUtils {
  static Color getTypeColor(String type) {
    switch (type) {
      case 'Fuego':
        return Color(0xFFFF9800);
      case 'Agua':
        return Color(0xFF2196F3);
      case 'Planta':
        return Color(0xFF8BC34A);
      case 'Eléctrico':
        return Color(0xFFFDD835);
      case 'Psíquico':
        return Color(0xFF673AB7);
      case 'Hielo':
        return Color(0xFF3D8BFF);
      case 'Dragon':
        return Color(0xFF00ACC1);
      case 'Siniestro':
        return Color(0xFF413D4A);
      case 'Hada':
        return Color(0xFFB931AF);
      case 'Lucha':
        return Color(0xFFE53935);
      case 'Volador':
        return Color(0xFF00BCD4);
      case 'Veneno':
        return Color(0xFF9C27B0);
      case 'Tierra':
        return Color(0xFF665714);
      case 'Roca':
        return Color(0xFF795548);
      case 'Bicho':
        return Color(0xFF43A047);
      case 'Fantasma':
        return Color(0xFF8E24AA);
      case 'Acero':
        return Color(0xFF3D616E);
      default:
        return Color(0xFF63696E);
    }
  }

  static String getTypeAsset(String type) {
    switch (type.toLowerCase()) {
      case 'fuego':
        return assets.Types.fire;
      case 'agua':
        return assets.Types.water;
      case 'planta':
        return assets.Types.grass;
      case 'eléctrico':
        return assets.Types.electric;
      case 'psíquico':
        return assets.Types.psychic;
      case 'hielo':
        return assets.Types.ice;
      case 'dragón':
        return assets.Types.dragon;
      case 'siniestro':
        return assets.Types.dark;
      case 'hada':
        return assets.Types.fairy;
      case 'lucha':
        return assets.Types.fighting;
      case 'volador':
        return assets.Types.flying;
      case 'veneno':
        return assets.Types.poison;
      case 'tierra':
        return assets.Types.ground;
      case 'roca':
        return assets.Types.rock;
      case 'bicho':
        return assets.Types.bug;
      case 'fantasma':
        return assets.Types.ghost;
      case 'acero':
        return assets.Types.steel;
      case 'normal':
        return assets.Types.normal;
      // Inglés
      case 'fire':
        return assets.Types.fire;
      case 'water':
        return assets.Types.water;
      case 'grass':
        return assets.Types.grass;
      case 'electric':
        return assets.Types.electric;
      case 'psychic':
        return assets.Types.psychic;
      case 'ice':
        return assets.Types.ice;
      case 'dragon':
        return assets.Types.dragon;
      case 'dark':
        return assets.Types.dark;
      case 'fairy':
        return assets.Types.fairy;
      case 'fighting':
        return assets.Types.fighting;
      case 'flying':
        return assets.Types.flying;
      case 'poison':
        return assets.Types.poison;
      case 'ground':
        return assets.Types.ground;
      case 'rock':
        return assets.Types.rock;
      case 'bug':
        return assets.Types.bug;
      case 'ghost':
        return assets.Types.ghost;
      case 'steel':
        return assets.Types.steel;
      default:
        return assets.Types.normal;
    }
  }

  static String getTypeBackgroundAsset(String type) {
    switch (type.toLowerCase()) {
      case 'fuego':
        return assets.Element.fire;
      case 'agua':
        return assets.Element.water;
      case 'planta':
        return assets.Element.grass;
      case 'eléctrico':
        return assets.Element.electric;
      case 'psíquico':
        return assets.Element.psychic;
      case 'hielo':
        return assets.Element.ice;
      case 'dragón':
        return assets.Element.dragon;
      case 'siniestro':
        return assets.Element.dark;
      case 'hada':
        return assets.Element.fairy;
      case 'lucha':
        return assets.Element.fighting;
      case 'volador':
        return assets.Element.flying;
      case 'veneno':
        return assets.Element.poison;
      case 'tierra':
        return assets.Element.ground;
      case 'roca':
        return assets.Element.rock;
      case 'bicho':
        return assets.Element.bug;
      case 'fantasma':
        return assets.Element.ghost;
      case 'acero':
        return assets.Element.steel;
      case 'normal':
        return assets.Element.normal;
      default:
        return assets.Element.normal;
    }
  }

  static List<String> getUniqueWeaknesses(Map<String, List<String>> weaknesses) {
    // Obtener todas las debilidades de todos los tipos del Pokémon
    Set<String> uniqueWeaknesses = {};
    
    for (var entry in weaknesses.entries) {
      // Agregar todas las debilidades de este tipo
      uniqueWeaknesses.addAll(entry.value);
    }
    
    return uniqueWeaknesses.toList();
  }
}
