import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/views/web_view/about/testimonial_card.dart';
import 'package:portfolio_website/views/web_view/testimonial/controller/testimonial_section_controller.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class TestimonialsSection extends GetView<TestimonialSectionController> {
  final bool isDarkMode;

  const TestimonialsSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Testimonials', subtitle: 'What Clients Say'),
        Obx(
          () => Wrap(
            children:
                controller.data.value.asMap().entries.map((entry) {
                  final index = entry.key;
                  final value = entry.value;
                  return TestimonialCard(
                    testimonial: value,
                    delay: index * 200,
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
