import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/views/web_view/contact/inner_widget/contact_form.dart';
import 'package:portfolio_website/views/web_view/contact/inner_widget/contact_info.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class ContactSection extends StatelessWidget {
  final bool isDarkMode;

  const ContactSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Contact Me', subtitle: 'Get In Touch'),
        _buildDesktopContent(context),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: ContactInfo()),
        const SizedBox(width: 40),
        Expanded(flex: 7, child: ContactForm()),
      ],
    );
  }
}
