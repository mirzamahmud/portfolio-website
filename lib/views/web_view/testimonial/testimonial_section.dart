import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/data/testimonial/testimonial_data.dart';
import 'package:portfolio_website/models/testimonial/testimonial_model.dart';
import 'package:portfolio_website/widgets/section/section_title.dart';

class TestimonialsSection extends StatelessWidget {
  final bool isDarkMode;
  
  const TestimonialsSection({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Testimonials',
          subtitle: 'What Clients Say',
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 768) {
              return _buildMobileTestimonials(context);
            } else {
              return _buildDesktopTestimonials(context);
            }
          },
        ),
      ],
    );
  }

  Widget _buildMobileTestimonials(BuildContext context) {
    return Column(
      children: TestimonialData.testimonials.asMap().entries.map((entry) {
        final index = entry.key;
        final testimonial = entry.value;
        return _buildTestimonialCard(context, testimonial, index * 200);
      }).toList(),
    );
  }

  Widget _buildDesktopTestimonials(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: TestimonialData.testimonials.asMap().entries.map((entry) {
        final index = entry.key;
        final testimonial = entry.value;
        return SizedBox(
          width: (MediaQuery.of(context).size.width < 1100) 
              ? (MediaQuery.of(context).size.width - 100) / 2 
              : (MediaQuery.of(context).size.width - 140) / 3,
          child: _buildTestimonialCard(context, testimonial, index * 200),
        );
      }).toList(),
    );
  }

  Widget _buildTestimonialCard(BuildContext context, TestimonialModel testimonial, int delay) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
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
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < testimonial.rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"${testimonial.content}"',
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(testimonial.avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    testimonial.position,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms, delay: Duration(milliseconds: delay)).slideY(begin: 0.2, end: 0);
  }
}