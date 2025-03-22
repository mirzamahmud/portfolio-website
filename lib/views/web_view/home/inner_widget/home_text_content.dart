import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/views/web_view/home/inner_widget/home_social_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTextContent extends StatelessWidget {
  const HomeTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm",
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 10),
        Text(
          "Mirza Mahmud Hossan",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 600.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: DefaultTextStyle(
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Colors.grey.withValues(alpha: 0.6),
              fontWeight: FontWeight.w500,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Mobile App Developer',
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Flutter Developer',
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
            ),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 900.ms),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            "A passionate mobile app developer creating beautiful, functional digital experiences, and high-quality mobile applications with a focus on user experience and performance.",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white
            ),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 1200.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=new');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 5,
                shadowColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
              ),
              child: const Text('Contact Me'),
            ).animate().fadeIn(duration: 600.ms, delay: 1500.ms).slideX(begin: -0.3, end: 0),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://drive.google.com/file/d/1UzKT1dJ_Lfh9ITk9SAaVdRInPBq47vmO/view?usp=sharing');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              child: const Text('My Resume'),
            ).animate().fadeIn(duration: 600.ms, delay: 1800.ms).slideX(begin: 0.3, end: 0),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            HomeSocialIcons(iconData: FontAwesomeIcons.github, linkUrl: 'https://github.com/mirzamahmud/'),
            HomeSocialIcons(iconData: FontAwesomeIcons.linkedin, linkUrl: 'https://linkedin.com/in/mirzamahmudhossan/'),
          ],
        ).animate().fadeIn(duration: 600.ms, delay: 2100.ms),
      ],
    );
  }
}