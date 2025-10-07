import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pokemon_2025/config/constants/assets.dart' as assets;

class PokemonLoader extends StatelessWidget {
  const PokemonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey[800]?.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(40),
        ),
        child: SpinPerfect(
          duration: const Duration(seconds: 5),
          child: Image.asset(
            assets.Icons.loader,
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
}
