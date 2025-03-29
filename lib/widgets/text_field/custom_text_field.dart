import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_website/constants/extensions/app_spacing_extension.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';
import 'package:portfolio_website/widgets/text/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String labelText, hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController textController;
  final FocusNode? textFocusNode;
  final int? maxLines;
  final int delay;

  const CustomTextField({
    required this.labelText,
    this.textInputAction,
    this.textInputType,
    required this.textController,
    this.textFocusNode,
    required this.hintText,
    this.maxLines,
    required this.delay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================ label ==========================================
            CustomText(
              title: labelText,
              textAlign: TextAlign.left,
              textStyle: AppTextStyle.labelLarge.copyWith(
                color: WHITE_COLOR,
                fontWeight: FontWeight.w400,
              ),
            ),
            12.verticalSpace,
            TextFormField(
              cursorColor: PRIMARY_COLOR,
              textInputAction: textInputAction,
              maxLines: maxLines,
              keyboardType: textInputType,
              controller: textController,
              focusNode: textFocusNode,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: WHITE_COLOR,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                filled: Theme.of(context).inputDecorationTheme.filled,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                contentPadding:
                    Theme.of(context).inputDecorationTheme.contentPadding,
                border: Theme.of(context).inputDecorationTheme.border,
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder,
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.focusedBorder,
                errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
              ),
            ),
          ],
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay))
        .slideY(begin: 0.2, end: 0);
  }
}
