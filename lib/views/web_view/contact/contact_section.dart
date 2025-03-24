import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/views/web_view/contact/inner_widget/contact_info.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class ContactSection extends StatelessWidget {
  final bool isDarkMode;

  const ContactSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Contact Me', subtitle: 'Get In Touch'),
        _buildDesktopContent(context),
      ],
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: ContactInfo()),
        const SizedBox(width: 40),
        Expanded(flex: 7, child: _buildContactForm(context)),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
                "Send Me a Message",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              const SizedBox(width: 16),
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
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Subject',
            hint: 'Subject',
            prefixIcon: Icons.subject,
            delay: 400,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Message',
            hint: 'Your Message',
            prefixIcon: Icons.message_outlined,
            maxLines: 5,
            delay: 500,
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    shadowColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text('Send Message'),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 600.ms)
                .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
          ),
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
