import 'package:flutter/material.dart';
import 'package:portfolio_website/views/web_view/about/inner_widget/about_content.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class AboutSection extends StatelessWidget {
  
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SectionTitle(
          title: 'About Me',
          subtitle: 'Get to know me',
        ),
        _buildDesktopContent(context),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(
            'assets/images/me_2.png',
            height: 600,
            width: 600,
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 6,
          child: AboutContent(),
        ),
      ],
    );
  }
}

