import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF3580FF);
  static const Color lightPrimaryText = Color(0xFF002055);
  static const Color lightSecondaryText = Color(0xFF848A94);
  static const Color darkPrimaryText = Color(0xFFFFFFFF);
  static const Color darkSecondaryText = Color(0xFF848A94);

  static const Color success = Color(0xFF4CAF50);
  static const Color successContainer = Color(0xFFC8E6C9);
  static const Color onSuccess = Color(0xFF1B5E20);
}

class TextSizes {
  static const double displayLarge = 64.0;
  static const double displayMedium = 44.0;
  static const double displaySmall = 36.0;
  static const double headlineLarge = 32.0;
  static const double headlineMedium = 24.0;
  static const double headlineSmall = 24.0;
  static const double titleLarge = 22.0;
  static const double titleMedium = 18.0;
  static const double titleSmall = 16.0;
  static const double labelLarge = 16.0;
  static const double labelMedium = 14.0;
  static const double labelSmall = 12.0;
  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;
}

TextTheme getTextTheme({
  required Color primaryText,
  required Color secondaryText,
}) {
  TextStyle textStyle(Color color, double size, FontWeight weight) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }

  return TextTheme(
    displayLarge:
        textStyle(primaryText, TextSizes.displayLarge, FontWeight.normal),
    displayMedium:
        textStyle(primaryText, TextSizes.displayMedium, FontWeight.normal),
    displaySmall:
        textStyle(primaryText, TextSizes.displaySmall, FontWeight.w600),
    headlineLarge:
        textStyle(primaryText, TextSizes.headlineLarge, FontWeight.w600),
    headlineMedium:
        textStyle(primaryText, TextSizes.headlineMedium, FontWeight.normal),
    headlineSmall:
        textStyle(primaryText, TextSizes.headlineSmall, FontWeight.w500),
    titleLarge: textStyle(primaryText, TextSizes.titleLarge, FontWeight.w500),
    titleMedium: textStyle(primaryText, TextSizes.titleMedium, FontWeight.w500),
    titleSmall: textStyle(primaryText, TextSizes.titleSmall, FontWeight.w500),
    labelLarge:
        textStyle(secondaryText, TextSizes.labelLarge, FontWeight.normal),
    labelMedium:
        textStyle(secondaryText, TextSizes.labelMedium, FontWeight.normal),
    labelSmall:
        textStyle(secondaryText, TextSizes.labelSmall, FontWeight.normal),
    bodyLarge: textStyle(primaryText, TextSizes.bodyLarge, FontWeight.normal),
    bodyMedium: textStyle(primaryText, TextSizes.bodyMedium, FontWeight.normal),
    bodySmall: textStyle(primaryText, TextSizes.bodySmall, FontWeight.normal),
  );
}
