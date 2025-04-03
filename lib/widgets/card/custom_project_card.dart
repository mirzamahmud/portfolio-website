import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/widgets/chips/custom_chip.dart';
import 'package:portfolio_website/widgets/text/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomProjectCard extends StatelessWidget {
  final String projectImage;
  final String projecTitle;
  final String projectDescription;
  final List<String> projectTools;
  final String projectUrl;
  final int delay;

  const CustomProjectCard({
    required this.projectImage,
    required this.projecTitle,
    required this.projectDescription,
    required this.projectTools,
    required this.projectUrl,
    required this.delay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: Get.width * 0.3,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: PRIMARY_COLOR, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        projectImage,
                        fit: BoxFit.fitWidth,
                        width: Get.width,
                        height: 256,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: CustomText(
                      title: projecTitle,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: CustomText(
                  maxLines: 3,
                  textOverflow: TextOverflow.ellipsis,
                  title: projectDescription,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      projectTools
                          .map((tech) => CustomChip(title: tech))
                          .toList(),
                ),
              ),
              16.verticalSpace,
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 16,
                  bottom: 16,
                  end: 16,
                ),
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final Uri uri = Uri.parse(projectUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  icon: Icon(Icons.language, size: 16),
                  label: CustomText(title: 'Live Url'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: Duration(milliseconds: delay))
        .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
  }
}
