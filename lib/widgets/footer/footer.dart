import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/views/web_view/contact/inner_widget/contact_social_icon.dart';

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
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContactSocialIcon(
                icon: FontAwesomeIcons.github,
                url: 'https://github.com/mirzamahmud/',
                delay: 600,
              ),
              ContactSocialIcon(
                icon: FontAwesomeIcons.linkedin,
                url: 'https://linkedin.com/in/mirzamahmudhossan/',
                delay: 700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
