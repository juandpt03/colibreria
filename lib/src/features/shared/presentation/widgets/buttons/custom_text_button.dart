import 'package:flutter/material.dart';
import 'package:colibreria/src/core/core.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isExpanded;
  final TextStyle? style;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isExpanded = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      child: TextButton(
        style: TextButton.styleFrom(
          visualDensity: VisualDensity.compact,
          foregroundColor: colors.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Gaps.radiusMedium),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              style ??
              textStyle?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
