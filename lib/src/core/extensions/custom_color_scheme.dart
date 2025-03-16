import 'package:flutter/material.dart';
import 'package:colibreria/src/core/config/theme/text_theme.dart';

extension CustomColorScheme on ColorScheme {
  Color get success => AppColors.success;
  Color get successContainer => AppColors.successContainer;
  Color get onSuccess => AppColors.onSuccess;

  Color get lightPrimaryText => AppColors.lightPrimaryText;
  Color get lightSecondaryText => AppColors.lightSecondaryText;
  Color get darkPrimaryText => AppColors.darkPrimaryText;
  Color get darkSecondaryText => AppColors.darkSecondaryText;
}
