import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class AboutSection extends StatelessWidget {
  
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SectionTitle(
          title: 'About Me',
          subtitle: 'Get to know me',
        ),
        _buildDesktopContent(context),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(
            'assets/images/me_2.png',
            height: 600,
            width: 600,
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 6,
          child: _buildAboutContent(context),
        ),
      ],
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Who am I?",
          style: AppTextStyle.headlineSmall.copyWith(color: GREY_COLOR),
        ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
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
              color: PRIMARY_COLOR.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "I'm Mirza Mahmud Hossan, a passionate Mobile Application Developer with ", style: AppTextStyle.bodyLarge.copyWith(color: WHITE_COLOR, height: 1.6, fontWeight: FontWeight.w400)),
                    TextSpan(text: "3 years of professional experience ", style: AppTextStyle.bodyLarge.copyWith(color: SECONDARY_COLOR, height: 1.6, fontWeight: FontWeight.w600)),
                    TextSpan(text: "specializing in Flutter development.", style: AppTextStyle.bodyLarge.copyWith(color: WHITE_COLOR, height: 1.6, fontWeight: FontWeight.w600)),
                  ]
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              Text(
                "I focus on creating intuitive, responsive, and visually appealing mobile applications that provide exceptional user experiences. My expertise includes developing cross-platform applications using Flutter, implementing complex UI designs, integrating RESTful APIs, and optimizing app performance.",
                style: AppTextStyle.bodyLarge.copyWith(color: WHITE_COLOR, height: 1.6, fontWeight: FontWeight.w400),
              ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              Text(
                "I'm constantly learning and staying updated with the latest technologies and best practices in mobile development to deliver high-quality solutions that meet client requirements and exceed user expectations.",
                style: AppTextStyle.bodyLarge.copyWith(color: WHITE_COLOR, height: 1.6, fontWeight: FontWeight.w400),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildInfoItem(context, 'Name', 'Mirza Mahmud Hossan', 100),
            _buildInfoItem(context, 'Email', 'contact@example.com', 200),
            _buildInfoItem(context, 'Location', 'Bangladesh', 300),
            _buildInfoItem(context, 'Availability', 'Available for remote work', 400),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value, int delay) {
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

