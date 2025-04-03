import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/views/web_view/about/inner_widget/about_info_item.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              "Who am I?",
              style: AppTextStyle.headlineSmall.copyWith(color: GREY_COLOR),
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 100.ms)
            .slideY(begin: 0.2, end: 0),
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
            border: Border.all(color: PRIMARY_COLOR.withValues(alpha: 0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "I'm Mirza Mahmud Hossan, a passionate Mobile Application Developer with ",
                          style: AppTextStyle.bodyLarge.copyWith(
                            color: WHITE_COLOR,
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "3 years of professional experience ",
                          style: AppTextStyle.bodyLarge.copyWith(
                            color: SECONDARY_COLOR,
                            height: 1.6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "specializing in Flutter development.",
                          style: AppTextStyle.bodyLarge.copyWith(
                            color: WHITE_COLOR,
                            height: 1.6,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms)
                  .slideY(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              Text(
                    "I focus on creating intuitive, responsive, and visually appealing mobile applications that provide exceptional user experiences. My expertise includes developing cross-platform applications using Flutter, implementing complex UI designs, integrating RESTful APIs, and optimizing app performance.",
                    style: AppTextStyle.bodyLarge.copyWith(
                      color: WHITE_COLOR,
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .slideY(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              Text(
                    "I'm constantly learning and staying updated with the latest technologies and best practices in mobile development to deliver high-quality solutions that meet client requirements and exceed user expectations.",
                    style: AppTextStyle.bodyLarge.copyWith(
                      color: WHITE_COLOR,
                      height: 1.6,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 400.ms)
                  .slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            AboutInfoItem(
              label: 'Name',
              value: 'Mirza Mahmud Hossan',
              delay: 100,
            ),
            AboutInfoItem(
              label: 'Email',
              value: 'mirza.dev25@gmail.com',
              delay: 200,
            ),
            AboutInfoItem(label: 'Location', value: 'Bangladesh', delay: 300),
            AboutInfoItem(
              label: 'Availability',
              value: 'Available for remote work',
              delay: 400,
            ),
          ],
        ),
      ],
    );
  }
}
