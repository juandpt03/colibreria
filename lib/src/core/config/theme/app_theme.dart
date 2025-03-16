import 'package:flutter/material.dart';
import 'package:colibreria/src/core/config/theme/text_theme.dart';

class AppTheme {
  final Color primaryColor;

  AppTheme({this.primaryColor = AppColors.primary});

  ThemeData _buildTheme(ColorScheme colorScheme, TextTheme textTheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: colorScheme.secondary),
      ),
    );
  }

  ThemeData get lightTheme {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: primaryColor,
      primary: primaryColor,
      surface: const Color(0xFFFAFAFA),
      onSurface: const Color(0xFF333333),
      error: const Color(0xFFD32F2F),
      onError: const Color(0xFFB00020),
      errorContainer: const Color(0xFFFDECEA),
    );

    final TextTheme textTheme = getTextTheme(
      primaryText: AppColors.lightPrimaryText,
      secondaryText: AppColors.lightSecondaryText,
    );

    return _buildTheme(colorScheme, textTheme);
  }

  ThemeData get darkTheme {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: primaryColor,
      primary: primaryColor,
      surface: const Color(0xFF0A0C16),
      onSurface: const Color(0xFFE0E0E0),
      error: const Color(0xFFCF6679),
      onError: const Color(0xFFFFFFFF),
      errorContainer: const Color(0xFF5E0A0A),
    );

    final TextTheme textTheme = getTextTheme(
      primaryText: AppColors.darkPrimaryText,
      secondaryText: AppColors.darkSecondaryText,
    );

    return _buildTheme(colorScheme, textTheme);
  }

  AppTheme copyWith({Color? primaryColor}) =>
      AppTheme(primaryColor: primaryColor ?? this.primaryColor);
}
