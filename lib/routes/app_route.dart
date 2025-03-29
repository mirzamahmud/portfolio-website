import 'package:get/get.dart';
import 'package:portfolio_website/routes/app_page.dart';
import 'package:portfolio_website/views/main_layout/binding/main_layout_binding.dart';
import 'package:portfolio_website/views/main_layout/main_layout.dart';
import 'package:portfolio_website/views/splash/binding/splash_binding.dart';
import 'package:portfolio_website/views/splash/splash_view.dart';

class AppRoute {
  static List<GetPage> route = [
    GetPage(
      name: AppPage.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppPage.mainLayout,
      page: () => MainLayout(),
      binding: MainLayoutBinding(),
    ),
  ];
}
