import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_2025/presentation/screens/pokemons/pokedex_screen.dart';
import 'package:pokemon_2025/presentation/screens/regions/regions_screen.dart';
import 'package:pokemon_2025/presentation/screens/favorites/favorites_screen.dart';
import 'package:pokemon_2025/presentation/screens/profile/profile_screen.dart';
import 'package:pokemon_2025/presentation/widgets/generals/custom_bottom_navigation_bar.dart';
import 'package:pokemon_2025/presentation/widgets/generals/custom_search_bar.dart';
import 'package:pokemon_2025/presentation/providers/providers.dart';

class MainLayout extends ConsumerStatefulWidget {

  const MainLayout({super.key});

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  int _selectedIndex = 0;

  // Lista de pantallas para cada tab
  final List<Widget> _screens = [
    const PokedexScreen(),
    const RegionsScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  bool _shouldShowSearchBar() {
    return _selectedIndex == 0;
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonProvider);
    final isLoading = pokemonState.isLoading;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Barra de búsqueda (solo para Pokedex)
            if (_shouldShowSearchBar()) 
              IgnorePointer(
                ignoring: isLoading,
                child: Opacity(
                  opacity: isLoading ? 0.5 : 1.0,
                  child: const CustomSearchBar(),
                ),
              ),
            
            // Contenido principal
            Expanded(
              child: _screens[_selectedIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: IgnorePointer(
        ignoring: isLoading,
        child: Opacity(
          opacity: isLoading ? 0.5 : 1.0,
          child: CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
