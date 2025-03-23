import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  
  const SectionTitle({
    super.key, 
    required this.title, 
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          subtitle,
          style: AppTextStyle.titleSmall.copyWith(color: PRIMARY_COLOR),
        ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTextStyle.headlineLarge.copyWith(color: WHITE_COLOR),
          textAlign: TextAlign.center,
        ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                PRIMARY_COLOR,
                SECONDARY_COLOR
              ],
            ),
            borderRadius: BorderRadius.circular(1.5),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideX(begin: 0.2, end: 0),
        const SizedBox(height: 60),
      ],
    );
  }
}