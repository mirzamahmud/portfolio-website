import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/dimension/app_dimention.dart';
import 'package:portfolio_website/widgets/text/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomElevatedButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimention.screenWidth,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: CustomText(title: title, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
