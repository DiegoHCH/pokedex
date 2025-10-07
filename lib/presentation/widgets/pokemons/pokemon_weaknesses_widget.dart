import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/utils/pokemon_utils.dart';

class PokemonWeaknessesWidget extends StatelessWidget {
  final Map<String, List<String>> weaknesses;

  const PokemonWeaknessesWidget({
    super.key,
    required this.weaknesses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Debilidades',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: PokemonUtils.getUniqueWeaknesses(weaknesses).map<Widget>((weakness) {
            return Container(
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    PokemonUtils.getTypeAsset(weakness),
                    width: 80,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
