import 'package:flutter/material.dart';
import 'package:portfolio_website/data/experience/experience_data.dart';
import 'package:portfolio_website/models/experience/experience_model.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/views/web_view/experiences/inner_widget/experience_timeline_item.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ================================ vertical bar ============================================
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
                color: PRIMARY_COLOR.withValues(alpha: 0.5),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        // ====================================== work experience ================================================
        Column(
          children: List.generate(ExperienceData.experienceList.length, (index) {
            final ExperienceModel experienceModel = ExperienceData.experienceList[index];
            if((index % 2 ) == 0){
              return Row(
                children: [
                  Expanded(
                    child: ExperienceTimelineItem(
                      title: experienceModel.designation,
                      company: experienceModel.companyName,
                      period: experienceModel.jobPeriod,
                      description: experienceModel.jobDescription,
                      isLeft: true,
                      delay: 100,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(child: Container()),
                ],
              );
              
            } else{
              return Row(
                children: [
                  Expanded(child: Container()),
                  const SizedBox(width: 40),
                  Expanded(
                    child: ExperienceTimelineItem(
                      title: experienceModel.designation,
                      company: experienceModel.companyName,
                      period: experienceModel.jobPeriod,
                      description: experienceModel.jobDescription,
                      isLeft: false,
                      delay: 300,
                    ),
                  ),
                ],
              );
            }
          }),
        )
      ],
    );
  }
}