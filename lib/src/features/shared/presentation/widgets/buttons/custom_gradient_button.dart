import 'package:flutter/material.dart';
import 'package:colibreria/src/core/core.dart';

class CustomGradientButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double height;
  final bool isExpanded;
  final bool isLoading;
  final String? loadingText;

  const CustomGradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 55.0,
    this.isExpanded = false,
    this.isLoading = false,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Container(
      height: height,
      width: isExpanded ? double.infinity : null,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colors.primary.withValues(alpha: 0.7), colors.primary],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.6, 1],
        ),
        borderRadius: BorderRadius.circular(Gaps.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: Gaps.paddingMedium,
          ),
        ),
        onPressed: onPressed,
        child:
            isLoading
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: textStyle?.fontSize,
                      width: textStyle?.fontSize,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2.0,
                      ),
                    ),
                    const SizedBox(width: Gaps.paddingSmall),
                    Text(
                      loadingText ?? AppLocalizations.of(context).loading,
                      style: textStyle?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
                : Text(
                  text,
                  style: textStyle?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }
}
