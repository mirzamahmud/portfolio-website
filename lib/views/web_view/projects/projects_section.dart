import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/extensions/app_assets_extentions.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/data/project/project_data.dart';
import 'package:portfolio_website/widgets/card/custom_project_card.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = ProjectData.projects;

    return Column(
      children: [
        SectionTitle(title: 'My Projects', subtitle: 'Recent Work'),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              projects.asMap().entries.map((entry) {
                final index = entry.key;
                final project = entry.value;
                return CustomProjectCard(
                  projectImage: project.imageUrl.imageAssetsBuilder,
                  projecTitle: project.title,
                  projectDescription: project.description,
                  projectTools: project.technologies,
                  projectUrl: project.liveUrl.toString(),
                  delay: index * 200,
                );
              }).toList(),
        ),
        20.verticalSpace,
      ],
    );
  }
}
