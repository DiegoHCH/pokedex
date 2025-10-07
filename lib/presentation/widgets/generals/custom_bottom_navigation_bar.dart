import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home, 
            color: selectedIndex == 0 ? Colors.blue : Colors.grey,
          ),
          label: 'Pokedex',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.public, 
            color: selectedIndex == 1 ? Colors.blue : Colors.grey,
          ),
          label: 'Regiones',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite, 
            color: selectedIndex == 2 ? Colors.blue : Colors.grey,
          ),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person, 
            color: selectedIndex == 3 ? Colors.blue : Colors.grey,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}
