import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';

class AboutInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final int delay;

  const AboutInfoItem({required this.label, required this.value, required this.delay, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:BLACK_COLOR.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: PRIMARY_COLOR.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _getIconForLabel(label),
            color: PRIMARY_COLOR,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyle.labelLarge.copyWith(color: PRIMARY_COLOR),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTextStyle.bodyMedium.copyWith(color: WHITE_COLOR),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay)).slideY(begin: 0.2, end: 0);
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Name': return Icons.person;
      case 'Email': return Icons.email;
      case 'Location': return Icons.location_on;
      case 'Availability': return Icons.access_time;
      default: return Icons.info;
    }
  }
}