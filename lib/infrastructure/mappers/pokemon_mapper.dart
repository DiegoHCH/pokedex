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
      baseExperience: pokemonData.baseExperience,
      height: pokemonData.height,
      name: pokemonData.name,
      order: pokemonData.order,
      sprite: pokemonData.sprites.frontDefault,
      stats: _mapStats(pokemonData.stats),
      types: _mapTypesFromTypeData(typeData),
      weight: pokemonData.weight,
      description: _getDescription(speciesData),
      weaknesses: _mapWeaknesses(typeData),
      category: _getCategory(speciesData),
      genderRate: speciesData.genderRate,
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
      if (type.names.isNotEmpty) {
        // Buscar nombre en español
        for (var name in type.names) {
          if (name.language.name == 'es') {
            types.add(name.name);
            break;
          }
        }
        // Si no hay en español, tomar el nombre en inglés
        if (types.isEmpty || types.last != type.name) {
          types.add(type.name);
        }
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
      final typeName = type.name;
      final damageRelations = type.damageRelations;
      
      final doubleDamageFrom = damageRelations.doubleDamageFrom
          .map((type) => type.name)
          .toList();
      
      if (doubleDamageFrom.isNotEmpty) {
        weaknesses[typeName] = doubleDamageFrom;
      }
    }
    
    return weaknesses;
  }

  static String _getCategory(PokemonSpecieResponse speciesData) {
    if (speciesData.genera.isNotEmpty) {
      for (var genus in speciesData.genera) {
        if (genus.language.name == 'es') {
          return genus.genus;
        }
      }
    }
    return '';
  }
}
