import 'package:get/get.dart';
import 'package:portfolio_website/views/web_view/contact/controller/contact_section_controller.dart';

class ContactSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactSectionController());
  }
}
