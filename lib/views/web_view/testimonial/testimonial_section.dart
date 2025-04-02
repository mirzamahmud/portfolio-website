import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/views/web_view/about/testimonial_card.dart';
import 'package:portfolio_website/views/web_view/testimonial/controller/testimonial_section_controller.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class TestimonialsSection extends GetView<TestimonialSectionController> {
  final bool isDarkMode;

  const TestimonialsSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(title: 'Testimonials', subtitle: 'What Clients Say'),
        Obx(
          () => SizedBox(
            height: 280,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.data.value.length,
              onPageChanged: (value) {},
              itemBuilder: (context, index) {
                bool isActive = index == controller.currentPage.value;
                return TestimonialCard(
                  testimonial: controller.data.value[index],
                  delay: controller.currentPage.value * 200,
                  isActive: isActive,
                );
              },
            ),
          ),
        ),
        20.verticalSpace,
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                controller.data.value.asMap().entries.map((entry) {
                  return controller.currentPage.value == entry.key
                      ? Container(
                        width: 12,
                        height: 6,
                        margin: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 4.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: PRIMARY_COLOR,
                        ),
                      )
                      : Container(
                        width: 12,
                        height: 6,
                        margin: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: GREY_COLOR, width: 1),
                        ),
                      );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
