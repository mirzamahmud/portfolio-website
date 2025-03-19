import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarsPainter extends CustomPainter {
  final int starCount = 100;
  final List<Offset> starPositions = [];
  final List<double> starSizes = [];
  final List<double> starOpacities = [];
  
  StarsPainter() {
    final random = math.Random();
    for (int i = 0; i < starCount; i++) {
      starPositions.add(Offset(
        random.nextDouble() * 1000,
        random.nextDouble() * 3000,
      ));
      starSizes.add(random.nextDouble() * 2 + 0.5);
      starOpacities.add(random.nextDouble() * 0.8 + 0.2);
    }
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < starCount; i++) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(starOpacities[i])
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(starPositions[i], starSizes[i], paint);
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}