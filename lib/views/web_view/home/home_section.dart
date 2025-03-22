import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/views/web_view/home/inner_widget/home_text_content.dart';
import 'dart:math' as math;

class HomeSection extends StatelessWidget {
  
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: HomeTextContent(),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: _buildProfileImage(context).animate().fadeIn(duration: 800.ms),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
              ],
            ),
          ),
        ).animate(
          onPlay: (controller) => controller.repeat(),
        ).custom(
          duration: 8.seconds,
          builder: (context, value, child) {
            return Transform.rotate(
              angle: value * 2 * math.pi,
              child: child,
            );
          },
        ),
        Container(
          width: 360,
          height: 360,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
                Theme.of(context).colorScheme.tertiary.withValues(alpha: 0.2),
              ],
            ),
          ),
        ).animate(
          onPlay: (controller) => controller.repeat(),
        ).custom(
          duration: 8.seconds,
          builder: (context, value, child) {
            return Transform.rotate(
              angle: -value * 2 * math.pi,
              child: child,
            );
          },
        ),
        Container(
          width: 320,
          height: 320,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              width: 2,
            ),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/me.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

