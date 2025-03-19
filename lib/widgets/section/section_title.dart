import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDarkMode;
  
  const SectionTitle({
    super.key, 
    required this.title, 
    required this.subtitle,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          subtitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(1.5),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideX(begin: 0.2, end: 0),
        const SizedBox(height: 40),
      ],
    );
  }
}