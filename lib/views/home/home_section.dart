import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

class HomeSection extends StatelessWidget {
  final bool isDarkMode;
  
  const HomeSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return Column(
      children: [
        SizedBox(
          height: isMobile ? 600 : 700,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: isMobile
                ? _buildMobileContent(context)
                : _buildDesktopContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage(context).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 40),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: _buildTextContent(context),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: _buildProfileImage(context).animate().fadeIn(duration: 800.ms),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.2),
                Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              ],
            ),
          ),
        ).animate(
          onPlay: (controller) => controller.repeat(),
        ).custom(
          duration: 8.seconds,
          builder: (context, value, child) {
            return Transform.rotate(
              angle: value * 2 * math.pi,
              child: child,
            );
          },
        ),
        Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
              ],
            ),
          ),
        ).animate(
          onPlay: (controller) => controller.repeat(),
        ).custom(
          duration: 8.seconds,
          builder: (context, value, child) {
            return Transform.rotate(
              angle: -value * 2 * math.pi,
              child: child,
            );
          },
        ),
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              width: 2,
            ),
            image: const DecorationImage(
              image: NetworkImage(
                'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=220&width=220',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, I'm",
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 10),
        const Text(
          "Mirza Mahmud Hossan",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 600.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 24,
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
                TypewriterAnimatedText(
                  'UI/UX Enthusiast',
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
            color: isDarkMode 
                ? Colors.black.withOpacity(0.3) 
                : Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: const Text(
            "3+ years of experience building high-quality mobile applications with a focus on user experience and performance.",
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 1200.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 30),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse('mailto:contact@example.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              ),
              child: const Text('Contact Me'),
            ).animate().fadeIn(duration: 600.ms, delay: 1500.ms).slideX(begin: -0.3, end: 0),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://example.com/resume.pdf');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              child: const Text('Download CV'),
            ).animate().fadeIn(duration: 600.ms, delay: 1800.ms).slideX(begin: 0.3, end: 0),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            _buildSocialIcon(context, FontAwesomeIcons.github, 'https://github.com'),
            _buildSocialIcon(context, FontAwesomeIcons.linkedin, 'https://linkedin.com'),
            _buildSocialIcon(context, FontAwesomeIcons.twitter, 'https://twitter.com'),
            _buildSocialIcon(context, FontAwesomeIcons.instagram, 'https://instagram.com'),
          ],
        ).animate().fadeIn(duration: 600.ms, delay: 2100.ms),
      ],
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode 
              ? Colors.white.withOpacity(0.1) 
              : Theme.of(context).colorScheme.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: FaIcon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () async {
            final Uri uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
        ),
      ),
    );
  }
}

