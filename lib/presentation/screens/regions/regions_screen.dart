import 'package:flutter/material.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_under_construction.dart';
import 'package:pokemon_2025/presentation/widgets/generals/custom_app_bar.dart';

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Regiones'),
      body: const Center(
        child: PokemonUnderConstruction(),
      ),
    );
  }
}
