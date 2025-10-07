import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_2025/config/theme/app_text_styles.dart';
import 'package:pokemon_2025/presentation/providers/pokemon_provider.dart';
import 'package:pokemon_2025/config/constants/assets.dart' as assets;
import 'package:pokemon_2025/presentation/widgets/generals/filter_modal.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({super.key});

  @override
  ConsumerState<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterModal(),
    );
  }

  void _onSearchChanged(String value) {
    // Cancelar el timer anterior si existe
    _debounceTimer?.cancel();
    
    // Si el campo está vacío, mostrar la lista normal de Pokémon
    if (value.isEmpty) {
      ref.read(pokemonProvider.notifier).loadPokemons();
      return;
    }
    
    // Crear un nuevo timer con delay de 500ms
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (_searchController.text.isNotEmpty) {
        ref.read(pokemonProvider.notifier).searchPokemon(_searchController.text.toLowerCase());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Procurar Pókemon...',
                  hintStyle: AppTextStyles.searchHint,
                  prefixIcon: const Image(image: AssetImage(assets.Icons.search)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                onChanged: _onSearchChanged,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: _showFilterModal,
                child: const Image(image: AssetImage(assets.Icons.search)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
