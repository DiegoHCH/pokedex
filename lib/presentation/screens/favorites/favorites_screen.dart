import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_2025/presentation/providers/providers.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_card.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_error.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_favorite_empty.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_loader.dart';
import 'package:pokemon_2025/presentation/widgets/generals/custom_app_bar.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    // Cargar Pokémon iniciales si no están cargados
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pokemonState = ref.read(pokemonProvider);
      if (!pokemonState.hasValue || pokemonState.value!.isEmpty) {
        ref.read(pokemonProvider.notifier).loadPokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Favoritos'),
      body: pokemonState.when(
        loading: () => const PokemonLoader(),
        error: (error, stack) => PokemonError(
          onRetry: () {
            ref.read(pokemonProvider.notifier).loadPokemons();
          },
        ),
      data: (pokemons) {
        // Filtrar solo los Pokémon favoritos
        final favorites = ref.watch(favoritesProvider).value ?? <int>{};
        final favoritePokemons = pokemons.where((pokemon) => favorites.contains(pokemon.order)).toList();

          if (favoritePokemons.isEmpty) {
            return const PokemonFavoriteEmpty();
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: favoritePokemons.length,
          itemBuilder: (context, index) {
            final pokemon = favoritePokemons[index];
            
            return Dismissible(
              key: Key('favorite_${pokemon.order}'),
              direction: DismissDirection.endToStart, // Solo swipe hacia la izquierda
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/icons/Delete.png',
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ),
              confirmDismiss: (direction) async {
                // Mostrar diálogo de confirmación
                return await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Eliminar de favoritos'),
                    content: Text('¿Estás seguro de que quieres eliminar a ${pokemon.name} de tus favoritos?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );
              },
              onDismissed: (direction) {
                // Eliminar de favoritos
                ref.read(favoritesProvider.notifier).toggleFavorite(pokemon.order);
                
                // Mostrar snackbar de confirmación
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${pokemon.name} eliminado de favoritos'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: PokemonCard(
                pokemon: pokemon,
                isFavorite: true, // Siempre true en esta pantalla
                enableFavoriteTap: false, // Deshabilitar tap en icono de favoritos
                onTap: () {
                  context.pushNamed('pokemon-detail', extra: pokemon);
                },
                onFavoriteTap: null, // No necesario ya que está deshabilitado
              ),
            );
          },
        );
      },
    ),
    );
  }
}
