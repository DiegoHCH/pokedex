import 'package:pokemon_2025/domain/domain.dart';
import 'package:pokemon_2025/infrastructure/infrastructure.dart' hide Pokemon;
import 'package:pokemon_2025/infrastructure/mappers/pokemon_mapper.dart';

class PokepiDatasource implements PokemonsDatasource {
  
  final DioClient _dioClient;
  
  PokepiDatasource({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<List<Pokemon>> getPokemons({int limit = 20, int offset = 0}) async {
    final response = await _dioClient.dio.get('/pokemon', queryParameters: {
      'limit': limit,
      'offset': offset,
    });
    final PokemonListResponse listResponse = PokemonListResponse.fromJson(response.data);
    
    // Extraer nombres de Pokémon de la lista
    final List<String> pokemonNames = listResponse.results.map((result) => result.name).toList();
    
    // Usar getPokemonByName para cada Pokémon con manejo de errores
    final List<Future<Pokemon?>> pokemonFutures = pokemonNames.map((name) async {
      try {
        return await getPokemonByName(name);
      } catch (e) {
        return null; // Retornar null si hay error
      }
    }).toList();
    
    final List<Pokemon?> pokemonResults = await Future.wait(pokemonFutures);
    
    // Filtrar los Pokémon que se cargaron exitosamente
    final List<Pokemon> pokemons = pokemonResults
        .where((pokemon) => pokemon != null)
        .cast<Pokemon>()
        .toList();
    
    return pokemons;
  }

  @override
  Future<Pokemon> getPokemonByName(String name) async {
    final response = await _dioClient.dio.get('/pokemon/$name');
    
    // Parsear la respuesta usando el modelo
    final PokemonDetailsResponse pokemonData = PokemonDetailsResponse.fromJson(response.data);
    
    // Obtener detalles de la primera habilidad
    PokemonAbilityResponse? abilityData;
    if (pokemonData.abilities.isNotEmpty) {
      final abilityUrl = pokemonData.abilities.first.ability?.url;
      if (abilityUrl != null) {
        final abilityResponse = await _dioClient.dio.get(abilityUrl);
        abilityData = PokemonAbilityResponse.fromJson(abilityResponse.data);
      }
    }
    
    // Obtener detalles de species
    final speciesUrl = pokemonData.species.url;
    final speciesResponse = await _dioClient.dio.get(speciesUrl);
    final PokemonSpecieResponse speciesData = PokemonSpecieResponse.fromJson(speciesResponse.data);
    
    // Obtener detalles de todos los types
    final List<Future<PokemonTypeResponse>> typeFutures = pokemonData.types.map((type) async {
      final typeUrl = type.type.url;
      final typeResponse = await _dioClient.dio.get(typeUrl);
      return PokemonTypeResponse.fromJson(typeResponse.data);
    }).toList();
    
    final List<PokemonTypeResponse> typeData = await Future.wait(typeFutures);
    
    // Mapear los datos usando el mapper
    final mappedPokemon = PokemonMapper.toEntity(
      pokemonData: pokemonData,
      abilityData: abilityData,
      speciesData: speciesData,
      typeData: typeData,
    );
    
    return mappedPokemon;
  }

}