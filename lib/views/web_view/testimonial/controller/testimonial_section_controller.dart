import 'package:get/get.dart';
import 'package:portfolio_website/data/testimonial/testimonial_data.dart';
import 'package:portfolio_website/models/testimonial/testimonial_model.dart';

class TestimonialSectionController extends GetxController {
  Rx<List<TestimonialModel>> data = Rx([]);

  @override
  void onInit() {
    super.onInit();
    data.value = TestimonialData.testimonials;
  }
}
