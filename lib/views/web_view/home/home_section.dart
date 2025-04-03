import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/utils/resource/app_image_assets.dart';
import 'package:portfolio_website/views/web_view/home/inner_widget/home_text_content.dart';
import 'package:portfolio_website/widgets/images/home_section_profile_image.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 6, child: HomeTextContent()),
            Expanded(
              flex: 4,
              child: Center(
                child: HomeSectionProfileImage(
                  profileImageSrc: AppImageAssets.myImage,
                ).animate().fadeIn(duration: 800.ms),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
