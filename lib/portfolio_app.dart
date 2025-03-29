import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/routes/app_page.dart';
import 'package:portfolio_website/routes/app_route.dart';
import 'package:portfolio_website/utils/theme/app_theme.dart';
import 'package:portfolio_website/views/splash/binding/splash_binding.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mirza Mahmud - Portfolio',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.splash,
      initialBinding: SplashBinding(),
      defaultTransition: Transition.noTransition,
      getPages: AppRoute.route,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
