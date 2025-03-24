import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/views/web_view/contact/inner_widget/contact_item.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              "Let's discuss your project",
              style: AppTextStyle.headlineSmall.copyWith(
                color: PRIMARY_COLOR,
                fontWeight: FontWeight.w600,
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 100.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
        Text(
              "Feel free to get in touch with me. I am always open to discussing new projects, creative ideas or opportunities to be part of your vision.",
              style: AppTextStyle.titleMedium.copyWith(color: GREY_COLOR),
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 30),
        ContactItem(
          icon: Icons.email_outlined,
          title: 'Email Me',
          content: 'mirza.dev25@gmail.com',
          url: 'mailto:mirza.dev25@gmail.com',
          delay: 300,
        ),
        const SizedBox(height: 20),
        ContactItem(
          icon: Icons.phone_outlined,
          title: 'Call Me',
          content: '+880 1846235375',
          url: '',
          delay: 400,
        ),
        const SizedBox(height: 20),
        ContactItem(
          icon: Icons.location_on_outlined,
          title: 'Location',
          content: 'Dhaka, Bangladesh',
          url: 'https://maps.google.com/?q=Dhaka,Bangladesh',
          delay: 500,
        ),
      ],
    );
  }
}
