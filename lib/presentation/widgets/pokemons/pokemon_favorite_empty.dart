import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/constants/assets.dart';
import 'package:pokemon_2025/config/theme/app_text_styles.dart';

class PokemonFavoriteEmpty extends StatelessWidget {
  const PokemonFavoriteEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.magikarp,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 24),
          Text(
            'No has marcado ningún Pokémon como favorito',
            style: AppTextStyles.screenTitle.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Haz clic en el icono de corazón de tus Pokémon favoritos y aparecerán aquí.',
              style: AppTextStyles.placeholderText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
