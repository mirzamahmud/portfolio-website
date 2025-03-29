import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const CustomText({
    required this.title,
    this.textAlign,
    this.textStyle,
    this.maxLines,
    this.textOverflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
