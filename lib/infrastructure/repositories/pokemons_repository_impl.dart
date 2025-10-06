

import 'package:pokemon_2025/domain/domain.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {

  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({required this.datasource});

  @override
  Future<List<Pokemon>> getPokemons({int limit = 20, int offset = 0}) {
    return datasource.getPokemons(limit: limit, offset: offset);
  }

  @override
  Future<Pokemon> getPokemonByName(String name) {
    return datasource.getPokemonByName(name);
  }

}