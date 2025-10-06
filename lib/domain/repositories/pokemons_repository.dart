import 'package:pokemon_2025/domain/entities/pokemon.dart';

abstract class PokemonsRepository {
  Future<List<Pokemon>> getPokemons({int limit = 20, int offset = 0});
  Future<Pokemon> getPokemonByName(String name);
}