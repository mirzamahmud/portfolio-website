import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/data/testimonial/testimonial_data.dart';
import 'package:portfolio_website/models/testimonial/testimonial_model.dart';

class TestimonialSectionController extends GetxController {
  final PageController pageController = PageController(viewportFraction: 0.4);
  Rx<int> currentPage = 0.obs;
  Rx<List<TestimonialModel>> data = Rx([]);
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    data.value = TestimonialData.testimonials;

    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage.value < data.value.length - 1) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    pageController.addListener(() {
      int next = pageController.page!.round();
      if (currentPage.value != next) {
        currentPage.value = next;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    timer?.cancel();
    pageController.dispose();
  }
}
