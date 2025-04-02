import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/models/home/home_navigation_model.dart';
import 'package:portfolio_website/views/web_view/contact/controller/contact_section_controller.dart';
import 'package:portfolio_website/views/web_view/testimonial/controller/testimonial_section_controller.dart';

class MainLayoutController extends GetxController
    with GetTickerProviderStateMixin {
  late ScrollController scrollController;
  Rx<int> currentIndex = 0.obs;
  Rx<bool> isVisible = false.obs;

  final List<HomeNavigationModel> navList = [
    HomeNavigationModel(navigatorTitle: "HOME", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "ABOUT", navigatorKey: GlobalKey()),
    HomeNavigationModel(
      navigatorTitle: "EXPERIENCE",
      navigatorKey: GlobalKey(),
    ),
    HomeNavigationModel(navigatorTitle: "SKILLS", navigatorKey: GlobalKey()),
    HomeNavigationModel(navigatorTitle: "PROJECTS", navigatorKey: GlobalKey()),
    HomeNavigationModel(
      navigatorTitle: "TESTIMONIALS",
      navigatorKey: GlobalKey(),
    ),
    HomeNavigationModel(navigatorTitle: "CONTACT", navigatorKey: GlobalKey()),
  ];

  void updateCurrentIndex() {
    final double currentScroll = scrollController.position.pixels;
    final double maxScroll = scrollController.position.maxScrollExtent;

    if (currentScroll <= 0) {
      currentIndex.value = 0;
      return;
    }

    if (currentScroll >= maxScroll) {
      currentIndex.value = navList.length - 1;
      return;
    }

    for (int i = 0; i < navList.length; i++) {
      if (navList[i].navigatorKey.currentContext == null) continue;

      final RenderBox renderBox =
          navList[i].navigatorKey.currentContext!.findRenderObject()
              as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      if (position.dy <= 100 && position.dy > -renderBox.size.height + 100) {
        if (currentIndex.value != i) {
          currentIndex.value = i;
        }
        break;
      }
    }
  }

  void scrollToSection(int index, BuildContext context) {
    if (navList[index].navigatorKey.currentContext == null) return;

    final RenderBox renderBox =
        navList[index].navigatorKey.currentContext!.findRenderObject()
            as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final offset = scrollController.offset + position.dy - 80;

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  void scrollListener() {
    if (scrollController.hasClients) {
      final showButton = scrollController.offset > 300;
      if (showButton != isVisible.value) {
        isVisible.value = showButton;
      }
    }
  }

  Future<void> initializeAllRequiredController() async {
    Get.put(TestimonialSectionController());
    Get.put(ContactSectionController());
  }

  @override
  void onInit() async {
    scrollController = ScrollController();
    scrollController.addListener(updateCurrentIndex);
    scrollController.addListener(scrollListener);

    await initializeAllRequiredController();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(updateCurrentIndex);
    scrollController.dispose();
    super.onClose();
  }
}
