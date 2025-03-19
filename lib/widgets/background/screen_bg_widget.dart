import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/painter/star_painter.dart';

class ScreenBgWidget extends StatelessWidget {
  const ScreenBgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF121212),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: StarsPainter(),
          ),
        ),
      ],
    );
  }
}