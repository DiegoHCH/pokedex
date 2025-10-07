import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/constants/assets.dart';
import 'package:pokemon_2025/config/theme/app_text_styles.dart';

class PokemonError extends StatelessWidget {
  final VoidCallback onRetry;

  const PokemonError({
    super.key,
    required this.onRetry,
  });

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
            'Algo salió mal...',
            style: AppTextStyles.screenTitle.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.',
              style: AppTextStyles.placeholderText,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text('Reintentar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
