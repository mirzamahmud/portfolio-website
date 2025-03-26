import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/views/main_layout/controller/main_layout_controller.dart';
import 'package:portfolio_website/views/web_view/about/about_section.dart';
import 'package:portfolio_website/views/web_view/contact/contact_section.dart';
import 'package:portfolio_website/views/web_view/experiences/experience_section.dart';
import 'package:portfolio_website/views/web_view/home/home_section.dart';
import 'package:portfolio_website/views/web_view/projects/projects_section.dart';
import 'package:portfolio_website/views/web_view/skills/skills_section.dart';
import 'package:portfolio_website/views/web_view/testimonial/testimonial_section.dart';
import 'package:portfolio_website/widgets/background/screen_bg_widget.dart';
import 'package:portfolio_website/widgets/footer/footer.dart';
import 'package:portfolio_website/widgets/header/header.dart';
import 'package:portfolio_website/widgets/navigation/navigation_item_widget.dart';
import 'package:portfolio_website/widgets/section/section.dart';

class WebLayoutView extends GetView<MainLayoutController> {
  const WebLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80),
        child: Header(
          title: 'Mirza Mahmud',
          navMenus:
              controller.navList.asMap().entries.map((entry) {
                final int index = entry.key;
                final String title = entry.value.navigatorTitle;

                return Obx(
                  () => NavigationItemWidget(
                    navList: controller.navList,
                    onPressed:
                        () => controller.scrollToSection(
                          index,
                          controller
                                  .navList[index]
                                  .navigatorKey
                                  .currentContext ??
                              context,
                        ),
                    btnTxt: title,
                    buttonStyle: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(
                        controller.currentIndex.value == index
                            ? PRIMARY_COLOR
                            : GREY_COLOR,
                      ),
                      overlayColor: WidgetStatePropertyAll(PRIMARY_COLOR),
                    ),
                    textStyle: AppTextStyle.titleSmall.copyWith(
                      fontWeight:
                          controller.currentIndex.value == index
                              ? FontWeight.w600
                              : FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
          onChangeTheme: () {},
        ),
      ),
      body: Stack(
        children: [
          // ======================================================= screen background =============================================
          ScreenBgWidget(),
          // ======================================================= scrollable section ============================================
          Scrollbar(
            thickness: 5,
            controller: controller.scrollController,
            trackVisibility: true,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  // =============================================== Home Section ==================================================
                  Section(
                    key: controller.navList[0].navigatorKey,
                    child: HomeSection(),
                  ),

                  // =============================================== About Section =================================================
                  Section(
                    key: controller.navList[1].navigatorKey,
                    child: AboutSection(),
                  ),

                  // ================================================ Experience Section ============================================
                  Section(
                    key: controller.navList[2].navigatorKey,
                    child: ExperienceSection(),
                  ),

                  // ================================================= Skills Section ===============================================
                  Section(
                    key: controller.navList[3].navigatorKey,
                    child: SkillsSection(),
                  ),

                  // ================================================= Projects Section ==============================================
                  Section(
                    key: controller.navList[4].navigatorKey,
                    child: ProjectsSection(),
                  ),

                  // ================================================= Testimonials Section =================================================
                  Section(
                    key: controller.navList[5].navigatorKey,
                    child: TestimonialsSection(),
                  ),

                  // ================================================= Contact Section =================================================
                  Section(
                    key: controller.navList[6].navigatorKey,
                    child: ContactSection(),
                  ),

                  // ================================================= Footer =================================================
                  Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      // ===================================================== floating action =============================================================
      floatingActionButton: AnimatedOpacity(
        opacity:
            controller.scrollController.hasClients &&
                    controller.scrollController.offset > 300
                ? 1.0
                : 0.0,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
              onPressed:
                  () => controller.scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOutCubic,
                  ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              child: const Icon(Icons.arrow_upward),
            )
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(
              delay: Duration(seconds: 3),
              duration: Duration(seconds: 2),
            ),
      ),
    );
  }
}
