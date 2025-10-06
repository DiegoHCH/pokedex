import 'package:pokemon_2025/domain/entities/pokemon.dart';

abstract class PokemonsDatasource {
  Future<List<Pokemon>> getPokemons({int page = 1});
}