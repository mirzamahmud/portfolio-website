import 'package:flutter/material.dart';
import 'package:portfolio_website/views/web_view/experiences/inner_widget/experience_timeline.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class ExperienceSection extends StatelessWidget {
  
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'My Experience',
          subtitle: 'Work Experience'
        ),
        ExperienceTimeline()
      ],
    );
  }
}