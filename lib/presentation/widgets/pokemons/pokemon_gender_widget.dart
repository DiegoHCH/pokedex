import 'package:flutter/material.dart';
import 'package:pokemon_2025/config/constants/assets.dart' as assets;

class PokemonGenderWidget extends StatelessWidget {
  final int genderRate;

  const PokemonGenderWidget({
    super.key,
    required this.genderRate,
  });

  @override
  Widget build(BuildContext context) {
    // Calcular porcentajes de género basado en genderRate
    double malePercentage;
    double femalePercentage;
    
    if (genderRate == -1) {
      malePercentage = 0;
      femalePercentage = 0;
    } else {
      switch (genderRate) {
        case 0:
          malePercentage = 100;
          femalePercentage = 0;
          break;
        case 1:
          malePercentage = 87.5;
          femalePercentage = 12.5;
          break;
        case 2:
          malePercentage = 75;
          femalePercentage = 25;
          break;
        case 3:
          malePercentage = 62.5;
          femalePercentage = 37.5;
          break;
        case 4:
          malePercentage = 50;
          femalePercentage = 50;
          break;
        case 5:
          malePercentage = 37.5;
          femalePercentage = 62.5;
          break;
        case 6:
          malePercentage = 25;
          femalePercentage = 75;
          break;
        case 7:
          malePercentage = 12.5;
          femalePercentage = 87.5;
          break;
        case 8:
          malePercentage = 0;
          femalePercentage = 100;
          break;
        default:
          malePercentage = 50;
          femalePercentage = 50;
      }
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'GÉNERO',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        
        // Mostrar diferente UI según si tiene género o no
        if (genderRate == -1) ...[
          // Sin género
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            child: Text(
              'Sin género',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
        ] else ...[
          // Con género - mostrar barra de progreso
          Row(
            children: [
              Expanded(
                flex: (malePercentage * 10).round(),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFF2551C3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: (femalePercentage * 10).round(),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF7596),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    assets.Icons.male,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${malePercentage.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    assets.Icons.female,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${femalePercentage.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ],
    );
  }
}
