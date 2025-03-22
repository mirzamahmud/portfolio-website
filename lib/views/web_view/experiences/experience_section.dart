import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class ExperienceSection extends StatelessWidget {
  final bool isDarkMode;
  
  const ExperienceSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'My Experience',
          subtitle: 'Work Experience',
          isDarkMode: isDarkMode,
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return _buildMobileTimeline(context);
            } else {
              return _buildDesktopTimeline(context);
            }
          },
        ),
      ],
    );
  }

  Widget _buildMobileTimeline(BuildContext context) {
    return Column(
      children: [
        _buildTimelineItem(
          context,
          'Senior Flutter Developer',
          'ABC Tech Solutions',
          'Jan 2023 - Present',
          'Led a team of 3 developers in building and maintaining multiple Flutter applications. Implemented CI/CD pipelines and improved app performance by 40%.',
          isLeft: true,
          delay: 100,
        ),
        _buildConnector(context),
        _buildTimelineItem(
          context,
          'Flutter Developer',
          'XYZ Mobile Apps',
          'Mar 2021 - Dec 2022',
          'Developed and launched 5 Flutter applications with over 100K combined downloads. Integrated payment gateways and implemented complex animations.',
          isLeft: true,
          delay: 300,
        ),
        _buildConnector(context),
        _buildTimelineItem(
          context,
          'Junior Mobile Developer',
          'Mobile Innovations Inc.',
          'Jun 2020 - Feb 2021',
          'Assisted in developing mobile applications using Flutter. Worked on UI implementation and bug fixing. Participated in code reviews and team meetings.',
          isLeft: true,
          delay: 500,
        ),
      ],
    );
  }

  Widget _buildDesktopTimeline(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            children: [
              Expanded(child: Container()),
              Container(
                width: 2,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTimelineItem(
                    context,
                    'Senior Flutter Developer',
                    'ABC Tech Solutions',
                    'Jan 2023 - Present',
                    'Led a team of 3 developers in building and maintaining multiple Flutter applications. Implemented CI/CD pipelines and improved app performance by 40%.',
                    isLeft: true,
                    delay: 100,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: Container()),
                const SizedBox(width: 40),
                Expanded(
                  child: _buildTimelineItem(
                    context,
                    'Flutter Developer',
                    'XYZ Mobile Apps',
                    'Mar 2021 - Dec 2022',
                    'Developed and launched 5 Flutter applications with over 100K combined downloads. Integrated payment gateways and implemented complex animations.',
                    isLeft: false,
                    delay: 300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: _buildTimelineItem(
                    context,
                    'Junior Mobile Developer',
                    'Mobile Innovations Inc.',
                    'Jun 2020 - Feb 2021',
                    'Assisted in developing mobile applications using Flutter. Worked on UI implementation and bug fixing. Participated in code reviews and team meetings.',
                    isLeft: true,
                    delay: 500,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(child: Container()),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConnector(BuildContext context) {
    return Container(
      width: 2,
      height: 40,
      color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context,
    String title,
    String company,
    String period,
    String description, {
    required bool isLeft,
    required int delay,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    period,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  company,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          if (!isLeft)
            Positioned(
              top: 20,
              left: -8,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          if (isLeft)
            Positioned(
              top: 20,
              right: -8,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms, delay: Duration(milliseconds: delay)).slideY(begin: 0.2, end: 0);
  }
}