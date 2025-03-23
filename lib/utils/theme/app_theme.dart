import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  // ========================================================== light theme ===============================================
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6C63FF),
      brightness: Brightness.light,
      primary: const Color(0xFF6C63FF),
      secondary: const Color(0xFFFF6584),
      tertiary: const Color(0xFF43CBFF),
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  // ========================================================== dark theme ===============================================
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6C63FF),
      brightness: Brightness.dark,
      primary: const Color(0xFF6C63FF),
      secondary: const Color(0xFFFF6584),
      tertiary: const Color(0xFF43CBFF),
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
  );
}