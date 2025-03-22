import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class AboutSection extends StatelessWidget {
  final bool isDarkMode;
  
  const AboutSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;
    
    return Column(
      children: [
        SectionTitle(
          title: 'About Me',
          subtitle: 'Get to know me',
          isDarkMode: isDarkMode,
        ),
        isMobile
            ? _buildMobileContent(context)
            : _buildDesktopContent(context),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(context).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 30),
        _buildAboutContent(context),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: _buildProfileImage(context).animate().fadeIn(duration: 800.ms),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 6,
          child: _buildAboutContent(context),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/placeholder.svg?height=400&width=400',
          height: 400,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Who am I?",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 100.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "I'm Mirza Mahmud Hossan, a passionate Mobile Application Developer with 3 years of professional experience specializing in Flutter development.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              const Text(
                "I focus on creating intuitive, responsive, and visually appealing mobile applications that provide exceptional user experiences. My expertise includes developing cross-platform applications using Flutter, implementing complex UI designs, integrating RESTful APIs, and optimizing app performance.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 16),
              const Text(
                "I'm constantly learning and staying updated with the latest technologies and best practices in mobile development to deliver high-quality solutions that meet client requirements and exceed user expectations.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildInfoItem(context, 'Name', 'Mirza Mahmud Hossan', 100),
            _buildInfoItem(context, 'Email', 'contact@example.com', 200),
            _buildInfoItem(context, 'Location', 'Bangladesh', 300),
            _buildInfoItem(context, 'Availability', 'Available for freelance', 400),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value, int delay) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDarkMode 
            ? Colors.black.withOpacity(0.2) 
            : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _getIconForLabel(label),
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay)).slideY(begin: 0.2, end: 0);
  }

  IconData _getIconForLabel(String label) {
    switch (label) {
      case 'Name': return Icons.person;
      case 'Email': return Icons.email;
      case 'Location': return Icons.location_on;
      case 'Availability': return Icons.access_time;
      default: return Icons.info;
    }
  }
}

