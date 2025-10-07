import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/constants/assets.dart';
import 'package:pokemon_2025/config/theme/app_text_styles.dart';

class PokemonUnderConstruction extends StatelessWidget {
  const PokemonUnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Images.jiglypuff,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 24),
          Text(
            '¡Muy pronto disponible!',
            style: AppTextStyles.screenTitle.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.',
              style: AppTextStyles.placeholderText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
