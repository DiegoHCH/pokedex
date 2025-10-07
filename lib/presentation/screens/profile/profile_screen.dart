import 'package:flutter/material.dart';
import 'package:pokemon_2025/presentation/widgets/pokemons/pokemon_under_construction.dart';
import 'package:pokemon_2025/presentation/widgets/generals/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Perfil'),
      body: const Center(
        child: PokemonUnderConstruction(),
      ),
    );
  }
}
