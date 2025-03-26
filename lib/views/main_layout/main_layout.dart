import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/views/main_layout/controller/main_layout_controller.dart';
import 'package:portfolio_website/views/mobile_view/mobile_layout_view.dart';
import 'package:portfolio_website/views/web_view/web_layout_view.dart';
import 'package:portfolio_website/widgets/layout/base_layout.dart';

class MainLayout extends GetView<MainLayoutController> {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      mobileLayout: MobileLayoutView(),
      tabletLayout: MobileLayoutView(),
      webLayout: WebLayoutView(),
    );
  }
}
