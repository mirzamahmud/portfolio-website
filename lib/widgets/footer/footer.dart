import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final bool isDarkMode;
  
  const Footer({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: isDarkMode 
            ? Colors.black
            : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const Text(
            "© 2023 Mirza Mahmud Hossan. All Rights Reserved.",
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Privacy Policy'),
              ),
              const Text('•'),
              TextButton(
                onPressed: () {},
                child: const Text('Terms of Service'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}