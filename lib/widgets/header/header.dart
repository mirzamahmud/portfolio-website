import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/widgets/text/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  final String title;
  final List<Widget> navMenus;
  final VoidCallback onChangeTheme;

  const Header({
    required this.title,
    required this.navMenus,
    required this.onChangeTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xff101010)),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ================================== left section ====================================
            Text(
              title,
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // =================================== nav menu ========================================
            Row(
              spacing: 8,
              children: List.generate(
                navMenus.length,
                (index) => navMenus[index],
              ),
            ),
            // ==================================== theme change ====================================
            PopupMenuButton(
              elevation: 0,
              position: PopupMenuPosition.under,
              offset: const Offset(0, 10),
              itemBuilder:
                  (context) => [
                    PopupMenuItem(
                      onTap: () async {
                        final Uri url = Uri.parse(
                          "https://pub.dev/packages/qr_scanner_with_effect",
                        );
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.inAppBrowserView,
                        )) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: "QR Scanner with Effect",
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                            color: WHITE_COLOR,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        final Uri url = Uri.parse(
                          "https://pub.dev/packages/api_service_interceptor",
                        );
                        if (!await launchUrl(
                          url,
                          mode: LaunchMode.inAppBrowserView,
                        )) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: "API Service Interceptor",
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                            color: WHITE_COLOR,
                          ),
                        ],
                      ),
                    ),
                  ],
              shape: Theme.of(context).popupMenuTheme.shape,
              child: Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: PRIMARY_COLOR,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Pub Packages",
                      textAlign: TextAlign.center,
                      textStyle: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: WHITE_COLOR,
                      ),
                    ),
                    8.horizontalSpace,
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: WHITE_COLOR,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
