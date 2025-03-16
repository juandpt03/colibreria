import 'package:flutter/material.dart';
import 'package:colibreria/src/core/config/theme/text_theme.dart';

class CustomLoading extends StatelessWidget {
  final Color color;
  final double? progressValue;
  final double? size;
  const CustomLoading({
    super.key,
    this.color = AppColors.primary,
    this.progressValue,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Center(
        child: CircularProgressIndicator(
          value: progressValue,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
