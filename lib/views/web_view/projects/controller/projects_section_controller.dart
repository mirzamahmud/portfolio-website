import 'package:get/get.dart';
import 'package:portfolio_website/data/project/project_data.dart';
import 'package:portfolio_website/models/project/project_model.dart';

class ProjectsSectionController extends GetxController {
  Rx<List<ProjectModel>> projects = Rx([]);

  @override
  void onInit() {
    super.onInit();
    projects.value = ProjectData.projects;
  }
}
