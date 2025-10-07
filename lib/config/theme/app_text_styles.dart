import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Estilos para Pokémon
  static TextStyle pokemonName = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF121212),
  );

  static TextStyle pokemonNumber = GoogleFonts.poppins(
    fontSize: 12,
    color: Color(0xFF424242),
    fontWeight: FontWeight.w600,
  );

  static TextStyle pokemonType = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  // Estilos para botones
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Estilos para títulos de pantalla
  static TextStyle screenTitle = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // Estilos para texto de búsqueda
  static TextStyle searchHint = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  // Estilos para mensajes de error
  static TextStyle errorText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.red,
  );

  // Estilos para texto de navegación
  static TextStyle navigationLabel = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Estilos para texto de placeholder
  static TextStyle placeholderText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}
