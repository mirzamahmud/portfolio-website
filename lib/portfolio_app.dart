import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/routes/app_page.dart';
import 'package:portfolio_website/routes/app_route.dart';
import 'package:portfolio_website/views/main_layout/binding/main_layout_binding.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mirza Mahmud - Portfolio',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.mainLayout,
      initialBinding: MainLayoutBinding(),
      defaultTransition: Transition.noTransition,
      getPages: AppRoute.route,
    );
  }
}
