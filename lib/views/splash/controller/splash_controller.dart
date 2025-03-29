import 'dart:async';

import 'package:get/get.dart';
import 'package:portfolio_website/routes/app_page.dart';

class SplashController extends GetxController {
  void navigateToMainLayout() {
    Future.delayed(
      const Duration(seconds: 4),
      () => Get.offAllNamed(AppPage.mainLayout),
    );
  }
}
