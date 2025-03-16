import 'package:flutter/material.dart';
import 'package:colibreria/src/core/core.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final bool success;

  const CustomSnackbar({super.key, required this.message, this.success = true});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(Gaps.radiusMedium),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Gaps.paddingMedium,
          vertical: Gaps.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: success ? colors.successContainer : colors.errorContainer,
          border: Border(
            bottom: BorderSide(
              color: success ? colors.success : colors.error,
              width: Gaps.dividerThickness * 4,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              success ? Icons.check_circle : Icons.error,
              color: success ? colors.success : colors.error,
              size: Gaps.iconMedium,
            ),
            const SizedBox(width: Gaps.paddingSmall),
            Expanded(
              child: Text(
                message,
                style: textStyles.labelMedium?.copyWith(
                  color: success ? colors.onSuccess : colors.onError,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
