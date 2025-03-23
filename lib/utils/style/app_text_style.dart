import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// | NAME           | SIZE |  HEIGHT |  WEIGHT |  SPACING |             |
/// |----------------|------|---------|---------|----------|-------------|
/// | displayLarge   | 57.0 |   64.0  | regular | -0.25    |             |
/// | displayMedium  | 45.0 |   52.0  | regular |  0.0     |             |
/// | displaySmall   | 36.0 |   44.0  | regular |  0.0     |             |
/// | headlineLarge  | 32.0 |   40.0  | regular |  0.0     |             |
/// | headlineMedium | 28.0 |   36.0  | regular |  0.0     |             |
/// | headlineSmall  | 24.0 |   32.0  | regular |  0.0     |             |
/// | titleLarge     | 22.0 |   28.0  | regular |  0.0     |             |
/// | titleMedium    | 16.0 |   24.0  | medium  |  0.15    |             |
/// | titleSmall     | 14.0 |   20.0  | medium  |  0.1     |             |
/// | bodyLarge      | 16.0 |   24.0  | regular |  0.5     |             |
/// | bodyMedium     | 14.0 |   20.0  | regular |  0.25    |             |
/// | bodySmall      | 12.0 |   16.0  | regular |  0.4     |             |
/// | labelLarge     | 14.0 |   20.0  | medium  |  0.1     |             |
/// | labelMedium    | 12.0 |   16.0  | medium  |  0.5     |             |
/// | labelSmall     | 11.0 |   16.0  | medium  |  0.5     |             |

class AppTextStyle {

  // =============================== display large =============================
  static final displayLarge = GoogleFonts.poppins(
    fontSize: 56,
    fontWeight: FontWeight.w600
  );

  // =============================== display medium ============================
  static final displayMedium = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.w500
  );

  // =============================== display small =============================
  static final displaySmall = GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.w400
  );

  // =============================== headline large =============================
  static final headlineLarge = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w600
  );

  // =============================== headline medium ============================
  static final headlineMedium = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w500
  );

  // =============================== headline small =============================
  static final headlineSmall = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w400
  );

  // =============================== title large ================================
  static final titleLarge = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600
  );
  // =============================== title medium ===============================
  static final titleMedium = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500
  );

  // =============================== title small ================================
  static final titleSmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400
  );

  // =============================== body large ================================
  static final bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600
  );
  // =============================== body medium ===============================
  static final bodyMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500
  );

  // =============================== body small ================================
  static final bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400
  );

  // =============================== label large ================================
  static final labelLarge = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600
  );
  // =============================== label medium ===============================
  static final labelMedium = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500
  );

  // =============================== label small ================================
  static final labelSmall = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400
  );
}