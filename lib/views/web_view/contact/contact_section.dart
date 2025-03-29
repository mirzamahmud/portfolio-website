import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/views/web_view/contact/controller/contact_section_controller.dart';
import 'package:portfolio_website/views/web_view/contact/inner_widget/contact_form.dart';
import 'package:portfolio_website/views/web_view/contact/inner_widget/contact_info.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class ContactSection extends GetView<ContactSectionController> {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Contact Me', subtitle: 'Get In Touch'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: ContactInfo()),
            const SizedBox(width: 40),
            Expanded(flex: 7, child: ContactForm(controller: controller)),
          ],
        ),
      ],
    );
  }
}
