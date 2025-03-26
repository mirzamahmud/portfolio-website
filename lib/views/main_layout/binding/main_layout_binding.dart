import 'package:get/get.dart';
import 'package:portfolio_website/views/main_layout/controller/main_layout_controller.dart';

class MainLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLayoutController());
  }
}
