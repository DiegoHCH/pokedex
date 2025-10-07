import 'package:pokemon_2025/domain/entities/pokemon.dart';
import 'package:pokemon_2025/infrastructure/infrastructure.dart' hide Pokemon;


class PokemonMapper {
  static Pokemon toEntity({
    required PokemonDetailsResponse pokemonData,
    PokemonAbilityResponse? abilityData,
    required PokemonSpecieResponse speciesData,
    required List<PokemonTypeResponse> typeData,
  }) {
    return Pokemon(
      ability: _getAbilityName(abilityData),
      baseExperience: pokemonData.baseExperience ?? 0,
      height: pokemonData.height ?? 0,
      name: pokemonData.name ?? '',
      order: pokemonData.order ?? 0,
      sprite: pokemonData.sprites?.frontDefault ?? '',
      stats: _mapStats(pokemonData.stats ?? []),
      types: _mapTypesFromTypeData(typeData),
      weight: pokemonData.weight ?? 0,
      description: _getDescription(speciesData),
      weaknesses: _mapWeaknesses(typeData),
      category: _getCategory(speciesData),
      genderRate: speciesData.genderRate ?? -1, 
      animation: pokemonData.sprites?.other?.showdown.frontDefault ?? '',
    );
  }

  static String _getAbilityName(PokemonAbilityResponse? abilityData) {
    if (abilityData != null && abilityData.names.isNotEmpty) {
      // Buscar nombre en español
      for (var name in abilityData.names) {
        if (name.language.name == 'es') {
          return name.name;
        }
      }
      // Si no hay en español, tomar el nombre en inglés
      return abilityData.name;
    }
    return '';
  }

  static Map<String, int> _mapStats(List<Stat> stats) {
    final Map<String, int> statsMap = {};
    for (var stat in stats) {
      final statName = stat.stat.name;
      final statValue = stat.baseStat;
      statsMap[statName] = statValue;
    }
    return statsMap;
  }

  static List<String> _mapTypesFromTypeData(List<PokemonTypeResponse> typeData) {
    final List<String> types = [];
    
    for (var type in typeData) {
      bool foundSpanish = false;
      
      if (type.names.isNotEmpty) {
        // Buscar nombre en español
        for (var name in type.names) {
          if (name.language.name == 'es') {
            types.add(name.name);
            foundSpanish = true;
            break;
          }
        }
      }
      
      // Si no encontró en español, usar el nombre en inglés como fallback
      if (!foundSpanish) {
        types.add(type.name ?? 'unknown');
      }
    }
    
    return types;
  }


  static String _getDescription(PokemonSpecieResponse speciesData) {
    if (speciesData.flavorTextEntries.isNotEmpty) {
      for (var entry in speciesData.flavorTextEntries) {
        if (entry.language.name == 'es') {
          return entry.flavorText.replaceAll('\n', ' ').replaceAll('\f', ' ');
        }
      }
    }
    return '';
  }

  static Map<String, List<String>> _mapWeaknesses(List<PokemonTypeResponse> typeData) {
    final Map<String, List<String>> weaknesses = {};
    
    for (var type in typeData) {
      final typeName = type.name ?? 'unknown';
      final damageRelations = type.damageRelations;
      
      if (damageRelations != null && damageRelations.doubleDamageFrom.isNotEmpty) {
        final doubleDamageFrom = damageRelations.doubleDamageFrom
            .map((type) => type.name ?? 'unknown')
            .toList();
        
        weaknesses[typeName] = doubleDamageFrom;
      } else {
        weaknesses[typeName] = [];
      }
    }
    
    return weaknesses;
  }

  static String _getCategory(PokemonSpecieResponse speciesData) {
    if (speciesData.genera.isNotEmpty) {
      for (var genus in speciesData.genera) {
        if (genus.language.name == 'es') {
          // Eliminar la palabra "Pokémon" de la categoría
          return genus.genus.replaceAll('Pokémon', '').trim();
        }
      }
    }
    return '';
  }
}
