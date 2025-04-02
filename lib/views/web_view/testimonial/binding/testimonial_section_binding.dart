import 'package:get/get.dart';
import 'package:portfolio_website/views/web_view/testimonial/controller/testimonial_section_controller.dart';

class TestimonialSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestimonialSectionController());
  }
}
