import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/utils/pokemon_utils.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_background_painter.dart';

class PokemonDetailImage extends StatelessWidget {
  final dynamic pokemon;
  final Color backgroundColor;

  const PokemonDetailImage({
    super.key,
    required this.pokemon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Fondo verde con curva
          Positioned.fill(
            child: CustomPaint(
              painter: PokemonBackgroundPainter(backgroundColor: backgroundColor),
            ),
          ),
          // Imagen de fondo del tipo centrada y ampliada
          Center(
            child: Image.asset(
              PokemonUtils.getTypeBackgroundAsset(
                pokemon.types.isNotEmpty ? pokemon.types[0] : 'normal',
              ),
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),
          ),

          // Pokémon centrado
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.network(
              pokemon.animation,
              width: 180,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
