import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_2025/domain/domain.dart';
import 'pokemons_repository_provider.dart';

class PokemonNotifier extends Notifier<AsyncValue<List<Pokemon>>> {
  late final PokemonsRepository _repository;

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
    if (state.hasValue) {
      final currentPokemons = state.value!;
      final offset = currentPokemons.length;
      
      try {
        final newPokemons = await _repository.getPokemons(limit: limit, offset: offset);
        final allPokemons = [...currentPokemons, ...newPokemons];
        state = AsyncValue.data(allPokemons);
      } catch (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      }
    }
  }

  Future<void> searchPokemon(String name) async {
    state = const AsyncValue.loading();
    
    try {
      final pokemon = await _repository.getPokemonByName(name);
      state = AsyncValue.data([pokemon]);
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
}

final pokemonProvider = NotifierProvider<PokemonNotifier, AsyncValue<List<Pokemon>>>(() {
  return PokemonNotifier();
});
