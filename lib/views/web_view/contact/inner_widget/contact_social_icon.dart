import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  final int delay;
  const ContactSocialIcon({
    required this.icon,
    required this.url,
    required this.delay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [PRIMARY_COLOR, SECONDARY_COLOR]),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: PRIMARY_COLOR.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          icon: FaIcon(icon, color: Colors.white),
          onPressed: () async {
            final Uri uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay));
  }
}
