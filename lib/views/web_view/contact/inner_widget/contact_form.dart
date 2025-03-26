import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: BLACK_COLOR.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: PRIMARY_COLOR, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                "Send Me a Message",
                style: AppTextStyle.titleLarge.copyWith(color: WHITE_COLOR),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 100.ms)
              .slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'Name',
                  hint: 'Your Name',
                  prefixIcon: Icons.person_outline,
                  delay: 200,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildTextField(
                  label: 'Email',
                  hint: 'Your Email',
                  prefixIcon: Icons.email_outlined,
                  delay: 300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTextField(
            label: 'Subject',
            hint: 'Subject',
            prefixIcon: Icons.subject,
            delay: 400,
          ),
          const SizedBox(height: 12),
          _buildTextField(
            label: 'Message',
            hint: 'Your Message',
            prefixIcon: Icons.message_outlined,
            maxLines: 1,
            delay: 500,
          ),
          const SizedBox(height: 16),
          InkWell(
                onTap: () {},
                child: SizedBox(
                  width: Get.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodyMedium.copyWith(
                            color: WHITE_COLOR,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 600.ms)
              .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms);
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData prefixIcon,
    int maxLines = 1,
    required int delay,
  }) {
    return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              prefixIcon: Icon(prefixIcon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFF6C63FF),
                  width: 2,
                ),
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay))
        .slideY(begin: 0.2, end: 0);
  }
}
