import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/theme/app_text_styles.dart';
import 'package:pokemon_2025/config/utils/pokemon_utils.dart';
import 'package:pokemon_2025/config/constants/assets.dart' as assets;

class PokemonCard extends StatelessWidget {
  final dynamic pokemon;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;
  final bool enableFavoriteTap;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
    this.onFavoriteTap,
    this.isFavorite = false,
    this.enableFavoriteTap = true,
  });

  @override
  Widget build(BuildContext context) {
    // Determinar color de fondo basado en el primer tipo
    Color backgroundColor = PokemonUtils.getTypeColor(pokemon.types.isNotEmpty ? pokemon.types[0] : 'normal');
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 116,
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 20),
                    child: Text(
                      'N°${pokemon.order.toString().padLeft(3, '0')}',
                      style: AppTextStyles.pokemonNumber,
                    ),
                  ),
                  const SizedBox(height: 4),
                   Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                     pokemon.name[0].toUpperCase() + pokemon.name.substring(1).toLowerCase(),
                     style: AppTextStyles.pokemonName,
                   ),
                  ),
                  const SizedBox(height: 8),
                  // Tags de tipos
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Wrap(
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
                  ),
                ],
              ),
            ),
            // Imagen del Pokémon
            Expanded(
               child: Stack(
                 children: [
                   // Imagen de fondo del tipo
                   Container(
                     width: double.infinity,
                     height: double.infinity,
                     decoration: BoxDecoration(
                       color: backgroundColor,
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(15),
                       child: Padding(
                         padding: const EdgeInsets.symmetric(vertical: 4),
                         child: Image.asset(
                           PokemonUtils.getTypeBackgroundAsset(pokemon.types.isNotEmpty ? pokemon.types[0] : 'normal'),
                           fit: BoxFit.contain,
                           alignment: Alignment.center,
                           errorBuilder: (context, error, stackTrace) {
                             return Container(
                               color: backgroundColor.withValues(alpha: 0.3),
                             );
                           },
                         ),
                       ),
                     ),
                   ),
                   // Imagen del Pokémon
                   Container(
                     width: double.infinity,
                     height: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(15),
                       child: Image.network(
                         pokemon.sprite,
                         fit: BoxFit.contain,
                         errorBuilder: (context, error, stackTrace) {
                           return const Icon(Icons.catching_pokemon, size: 40);
                         },
                       ),
                     ),
                   ),
                  // Icono de favorito
                  Positioned(
                    top: -4,
                    right: -6,
                    child: GestureDetector(
                      onTap: enableFavoriteTap ? onFavoriteTap : null,
                      child: Image.asset(
                        isFavorite ? assets.Icons.favoriteYes : assets.Icons.favoriteNo,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
