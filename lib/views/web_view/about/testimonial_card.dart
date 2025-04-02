import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/models/testimonial/testimonial_model.dart';

class TestimonialCard extends StatelessWidget {
  final TestimonialModel testimonial;
  final int delay;
  final bool isActive;

  const TestimonialCard({
    required this.testimonial,
    required this.delay,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsetsDirectional.only(top: 20, end: 12),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            boxShadow:
                isActive
                    ? []
                    : [
                      BoxShadow(
                        color: Theme.of(
                          context,
                        ).cardColor.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
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
        )
        .animate()
        .fadeIn(duration: 800.ms, delay: Duration(milliseconds: delay))
        .slideY(begin: 0.2, end: 0);
  }
}
