import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_2025/config/constants/assets.dart' as assets;
import 'package:pokemon_2025/config/theme/app_text_styles.dart';
import 'package:pokemon_2025/config/utils/pokemon_utils.dart';
import 'package:pokemon_2025/presentation/providers/providers.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_detail_image.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_stat_card.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_gender_widget.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_weaknesses_widget.dart';

class PokemonDetailScreen extends ConsumerWidget {
  final dynamic pokemon;

  const PokemonDetailScreen({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider).value ?? <int>{};
    final isFavorite = favorites.contains(pokemon.order);
    
    // Determinar color de fondo basado en el primer tipo
    Color backgroundColor = PokemonUtils.getTypeColor(pokemon.types.isNotEmpty ? pokemon.types[0] : 'normal');
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Fondo blanco por defecto
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header con botones de navegación
              Stack(
                children: [
                  PokemonDetailImage(
                    pokemon: pokemon,
                    backgroundColor: backgroundColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(favoritesProvider.notifier).toggleFavorite(pokemon.order);
                          },
                          icon: Image.asset(
                            isFavorite ? assets.Icons.favoriteYes : assets.Icons.favoriteNo,
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Contenido principal
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemon.name[0].toUpperCase() + pokemon.name.substring(1).toLowerCase(),
                              style: AppTextStyles.screenTitle.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'N°${pokemon.order.toString().padLeft(3, '0')}',
                              style: AppTextStyles.pokemonNumber.copyWith(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          children: pokemon.types.take(2).map<Widget>((type) {
                            return Container(
                              margin: const EdgeInsets.only(right: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    PokemonUtils.getTypeAsset(type),
                                    width: 80,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          pokemon.description,
                          style: AppTextStyles.placeholderText.copyWith(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: PokemonStatCard(
                                label: 'PESO',
                                value: '${(pokemon.weight / 10).toStringAsFixed(1)} kg',
                                iconAsset: assets.Icons.weight,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: PokemonStatCard(
                                label: 'ALTURA',
                                value: '${(pokemon.height / 10).toStringAsFixed(1)} m',
                                iconAsset: assets.Icons.height,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: PokemonStatCard(
                                label: 'CATEGORÍA',
                                value: pokemon.category.toUpperCase(),
                                iconAsset: assets.Icons.category,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: PokemonStatCard(
                                label: 'HABILIDAD',
                                value: pokemon.ability,
                                iconAsset: assets.Icons.ability,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        PokemonGenderWidget(genderRate: pokemon.genderRate),
                        const SizedBox(height: 24),
                        PokemonWeaknessesWidget(weaknesses: pokemon.weaknesses),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
