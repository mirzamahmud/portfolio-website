import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class SkillsSection extends StatelessWidget {
  final bool isDarkMode;

  const SkillsSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'My Skills', subtitle: 'What I Know'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Mobile App Development",
                        style: AppTextStyle.headlineLarge.copyWith(
                          color: PRIMARY_COLOR,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Skills Include",
                        style: AppTextStyle.headlineSmall.copyWith(
                          color: WHITE_COLOR,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "With vast knowledge and experience in Java, Dart, Flutter, and also more.",
                    style: AppTextStyle.titleMedium.copyWith(
                      color: GREY_COLOR,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 50),
            Expanded(
              child: GridView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 150,
                  crossAxisCount: 3,
                ),
                children: [
                  // ---------- java  icon ----------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.java,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Java",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // ---------- dart icon ----------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.dartLang,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Dart",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ---------------- flutter icon -----------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.flutter,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Flutter",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ---------------- firebase icon -------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.fire,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Firebase",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ---------------- REST APIs -------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.server,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "REST APIs",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ---------------- git --------------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.git,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Git",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ---------------- github --------------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.github,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "GitHub",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // ---------------- CI/CD --------------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsetsDirectional.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BLACK_COLOR.withValues(alpha: 0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: PRIMARY_COLOR, width: 2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.infinity,
                              color: PRIMARY_COLOR,
                              size: 50,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "CI/CD",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
