import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSocialIcons extends StatelessWidget {
  final IconData iconData;
  final String linkUrl;

  const HomeSocialIcons({
    required this.iconData,
    required this.linkUrl,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: FaIcon(
            iconData,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () async {
            final Uri uri = Uri.parse(linkUrl);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
        ),
      ),
    );
  }
}