import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/data/skill/skills_data.dart';
import 'package:portfolio_website/models/skill/skills_model.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class SkillsSection extends StatelessWidget {
  final bool isDarkMode;
  
  const SkillsSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'My Skills',
          subtitle: 'What I Know',
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 768;
            return Column(
              children: [
                _buildSkillCategory(
                  context,
                  'Mobile Development',
                  [
                    SkillSModel('Flutter', 0.9, Colors.blue),
                    SkillSModel('Dart', 0.9, Colors.teal),
                    SkillSModel('React Native', 0.7, Colors.purple),
                    SkillSModel('Android (Java/Kotlin)', 0.6, Colors.green),
                    SkillSModel('iOS (Swift)', 0.5, Colors.orange),
                  ],
                  isMobile: isMobile,
                  delay: 100,
                ),
                const SizedBox(height: 40),
                _buildSkillCategory(
                  context,
                  'UI/UX & Design',
                  [
                    SkillSModel('UI Design', 0.8, Colors.pink),
                    SkillSModel('Animations', 0.85, Colors.amber),
                    SkillSModel('Responsive Design', 0.9, Colors.indigo),
                    SkillSModel('Figma', 0.7, Colors.red),
                    SkillSModel('Adobe XD', 0.6, Colors.deepPurple),
                  ],
                  isMobile: isMobile,
                  delay: 300,
                ),
                const SizedBox(height: 40),
                _buildSkillCategory(
                  context,
                  'Backend & Others',
                  [
                    SkillSModel('Firebase', 0.85, Colors.amber),
                    SkillSModel('RESTful APIs', 0.8, Colors.blue),
                    SkillSModel('GraphQL', 0.6, Colors.pink),
                    SkillSModel('Git & GitHub', 0.85, Colors.black),
                    SkillSModel('CI/CD', 0.7, Colors.teal),
                  ],
                  isMobile: isMobile,
                  delay: 500,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<SkillSModel> skills, {
    required bool isMobile,
    required int delay,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay)).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
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
          child: isMobile
              ? Column(
                  children: skills.map((skill) => _buildSkillItem(context, skill, delay)).toList(),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: skills
                            .sublist(0, (skills.length / 2).ceil())
                            .map((skill) => _buildSkillItem(context, skill, delay))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        children: skills
                            .sublist((skills.length / 2).ceil())
                            .map((skill) => _buildSkillItem(context, skill, delay + 200))
                            .toList(),
                      ),
                    ),
                  ],
                ),
        ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay + 100)),
      ],
    );
  }

  Widget _buildSkillItem(BuildContext context, SkillSModel skill, int baseDelay) {
    final double delay = baseDelay + SkillsData.skills.indexOf(skill) * 100;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${(skill.level * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDarkMode 
                      ? Colors.white.withOpacity(0.1) 
                      : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: skill.level),
                duration: const Duration(milliseconds: 1500),
                builder: (context, value, _) => Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * value,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        skill.color,
                        skill.color.withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: skill.color.withOpacity(0.5),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: int.parse(delay.toString()))).slideX(begin: 0.2, end: 0);
  }
}

