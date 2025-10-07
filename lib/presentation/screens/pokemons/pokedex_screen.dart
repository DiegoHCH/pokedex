import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_2025/presentation/providers/providers.dart';
import 'package:pokemon_2025/presentation/providers/filter_provider.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_card.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_error.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_favorite_empty.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_loader.dart';

class PokedexScreen extends ConsumerStatefulWidget {
  const PokedexScreen({super.key});

  @override
  ConsumerState<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends ConsumerState<PokedexScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar Pokémon iniciales
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pokemonProvider.notifier).loadPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonProvider);
    final isLoadingMore = ref.watch(pokemonProvider.notifier).isLoadingMore;
    final hasActiveFilters = ref.watch(filterProvider).isNotEmpty;
    
    return pokemonState.when(
      loading: () => const PokemonLoader(),
      error: (error, stack) => PokemonError(
        onRetry: () {
          ref.read(pokemonProvider.notifier).loadPokemons();
        },
      ),
      data: (pokemons) {
        // Mostrar mensaje de filtros si hay filtros activos
        if (hasActiveFilters) {
          return Column(
            children: [
              // Mensaje de resultados con filtros
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 16, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      'Se han encontrado ',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '${pokemons.length} resultados',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        ref.read(filterProvider.notifier).clearFilters();
                        ref.read(pokemonProvider.notifier).loadPokemons();
                      },
                      child: const Text(
                        'Borrar filtro',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xFF1E88E5),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF1E88E5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Lista de Pokémon filtrados
              Expanded(
                child: pokemons.isEmpty
                    ? const PokemonFavoriteEmpty()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: pokemons.length,
                        itemBuilder: (context, index) {
                          final pokemon = pokemons[index];
                          
                          return PokemonCard(
                            pokemon: pokemon,
                            isFavorite: ref.watch(favoritesProvider).value?.contains(pokemon.order) ?? false,
                            enableFavoriteTap: true,
                            onTap: () {
                              context.pushNamed('pokemon-detail', extra: pokemon);
                            },
                            onFavoriteTap: () {
                              ref.read(favoritesProvider.notifier).toggleFavorite(pokemon.order);
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        }
        
        // Lista normal sin filtros
        return pokemons.isEmpty
            ? const PokemonFavoriteEmpty()
            : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: pokemons.length + (isLoadingMore && !hasActiveFilters ? 1 : 0),
              itemBuilder: (context, index) {
                // Mostrar indicador de carga al final (solo si no hay filtros activos)
                if (index == pokemons.length && !hasActiveFilters) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: PokemonLoader(),
                  );
                }
                
                final pokemon = pokemons[index];
                
                // Cargar más Pokémon cuando llegue a los últimos 10 (solo si no hay filtros activos)
                if (!hasActiveFilters && index == pokemons.length - 10) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ref.read(pokemonProvider.notifier).loadMorePokemons();
                  });
                }
                
                return PokemonCard(
                  pokemon: pokemon,
                  isFavorite: ref.watch(favoritesProvider).value?.contains(pokemon.order) ?? false,
                  enableFavoriteTap: true, // Habilitar tap en icono de favoritos
                  onTap: () {
                    context.pushNamed('pokemon-detail', extra: pokemon);
                  },
                  onFavoriteTap: () {
                    ref.read(favoritesProvider.notifier).toggleFavorite(pokemon.order);
                  },
                );
              },
            );
      }
    );
  }
}
