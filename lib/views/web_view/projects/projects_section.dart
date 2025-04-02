import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/data/project/project_data.dart';
import 'package:portfolio_website/models/project/project_model.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  final bool isDarkMode;

  const ProjectsSection({super.key, this.isDarkMode = false});

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
                return StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: _buildProjectCard(context, project, index * 100),
                );
              }).toList(),
        ),
        20.verticalSpace,
      ],
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    ProjectModel project,
    int delay,
  ) {
    return Container(
          width: Get.width * 0.3,
          decoration: BoxDecoration(
            color: BLACK_COLOR.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: BLACK_COLOR.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: PRIMARY_COLOR),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Stack(
                  children: [
                    project.imageUrl.isEmpty
                        ? Container(
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                        )
                        : Image.network(
                          project.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                            stops: const [0.7, 1.0],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        project.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.description,
                      style: const TextStyle(fontSize: 14, height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          project.technologies
                              .map((tech) => _buildTechChip(context, tech))
                              .toList(),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        if (project.liveUrl != null)
                          _buildProjectButton(
                            context,
                            'Live Demo',
                            project.liveUrl!,
                            icon: Icons.language,
                          ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: Duration(milliseconds: delay))
        .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
  }

  Widget _buildTechChip(BuildContext context, String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
            Theme.of(context).colorScheme.secondary.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        tech,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildProjectButton(
    BuildContext context,
    String label,
    String url, {
    required IconData icon,
  }) {
    return OutlinedButton.icon(
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      icon: FaIcon(icon, size: 16),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
    );
  }
}
