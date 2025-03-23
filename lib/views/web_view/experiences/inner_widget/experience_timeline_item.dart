import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';

class ExperienceTimelineItem extends StatelessWidget {
  final String title;
  final String company;
  final String period;
  final String description;
  final bool isLeft;
  final int delay;
  const ExperienceTimelineItem({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    required this.isLeft,
    required this.delay,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: BLACK_COLOR.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: BLACK_COLOR.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
              border: Border.all(
                color: PRIMARY_COLOR,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =============================== period =======================================
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        PRIMARY_COLOR,
                        SECONDARY_COLOR,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    period,
                    style: AppTextStyle.labelMedium.copyWith(color: WHITE_COLOR),
                    ),
                ),
                const SizedBox(height: 10),
                // =============================== job title ====================================
                Text(
                  title,
                  style: AppTextStyle.titleLarge.copyWith(color: WHITE_COLOR),
                ),
                const SizedBox(height: 5),
                // ================================ company name =================================
                Text(
                  company,
                  style: AppTextStyle.titleMedium.copyWith(color: PRIMARY_COLOR),
                ),
                const SizedBox(height: 10),
                // ================================= job descrition ==============================
                Text(
                  description,
                  style: AppTextStyle.titleSmall.copyWith(color: GREY_COLOR),
                ),
              ],
            ),
          ),
          if (!isLeft)
            Positioned(
              top: 20,
              left: -8,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (isLeft)
            Positioned(
              top: 20,
              right: -8,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: PRIMARY_COLOR,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms, delay: Duration(milliseconds: delay)).slideY(begin: 0.2, end: 0);
  }
}