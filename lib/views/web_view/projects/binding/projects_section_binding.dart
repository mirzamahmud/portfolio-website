import 'package:get/get.dart';
import 'package:portfolio_website/views/web_view/projects/controller/projects_section_controller.dart';

class ProjectsSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectsSectionController());
  }
}
