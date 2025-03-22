import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  
  const Section({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Center(child: child),
      ),
    );
  }
}