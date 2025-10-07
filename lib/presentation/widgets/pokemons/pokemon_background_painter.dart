import 'package:flutter/material.dart';

class PokemonBackgroundPainter extends CustomPainter {
  final Color backgroundColor;

  PokemonBackgroundPainter({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path();

    // Empieza desde la esquina superior izquierda
    path.moveTo(0, 0);

    // Lado izquierdo hasta la base de la curva
    path.lineTo(0, size.height * 0.75);

    // Curva más pronunciada hacia abajo (ajuste de profundidad)
    path.quadraticBezierTo(
      size.width * 0.5,  // Punto de control X (centro)
      size.height * 1.1, // Punto de control Y (más abajo para hacerla más "panza")
      size.width,         // Punto final X (derecha)
      size.height * 0.75, // Punto final Y
    );

    // Subimos hasta la esquina superior derecha
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant PokemonBackgroundPainter oldDelegate) {
    return oldDelegate.backgroundColor != backgroundColor;
  }
}

