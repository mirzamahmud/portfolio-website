import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/color/app_colors.dart';
import 'package:portfolio_website/utils/style/app_text_style.dart';

class AppTheme {
  // ========================================================== dark theme ===============================================
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SCREEN_BG_COLOR,
    cardColor: BLACK_COLOR,
    primaryColor: PRIMARY_COLOR,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: PRIMARY_COLOR,
      secondary: SECONDARY_COLOR,
      error: SECONDARY_COLOR,
      surface: SCREEN_BG_COLOR,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.displayLarge,
      displayMedium: AppTextStyle.displayMedium,
      displaySmall: AppTextStyle.displaySmall,
      headlineLarge: AppTextStyle.headlineLarge,
      headlineMedium: AppTextStyle.headlineMedium,
      headlineSmall: AppTextStyle.headlineSmall,
      titleLarge: AppTextStyle.titleLarge,
      titleMedium: AppTextStyle.titleMedium,
      titleSmall: AppTextStyle.titleSmall,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
      labelLarge: AppTextStyle.labelLarge,
      labelMedium: AppTextStyle.labelMedium,
      labelSmall: AppTextStyle.labelSmall,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyle.labelLarge.copyWith(
        color: GREY_COLOR,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: EdgeInsetsDirectional.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      prefixIconColor: GREY_COLOR,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: GREY_COLOR, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: PRIMARY_COLOR, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: GREY_COLOR, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: SECONDARY_COLOR, width: 1),
      ),
    ),
    iconTheme: IconThemeData(size: 20),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: PRIMARY_COLOR,
        foregroundColor: WHITE_COLOR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        alignment: Alignment.center,
        textStyle: AppTextStyle.bodyMedium,
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(color: PRIMARY_COLOR, width: 1),
      ),
    ),
  );
}
