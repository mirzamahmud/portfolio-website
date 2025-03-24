import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';

class Footer extends StatelessWidget {
  final bool isDarkMode;

  const Footer({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(color: BLACK_COLOR),
      child: Column(
        children: [
          Text(
            "© 2022 Mirza Mahmud Hossan. All Rights Reserved.",
            style: AppTextStyle.bodyMedium.copyWith(color: WHITE_COLOR),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: const Text('Privacy Policy')),
              const Text('•'),
              TextButton(
                onPressed: () {},
                child: const Text('Terms of Service'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
