import 'package:flutter/material.dart';
import 'package:colibreria/src/core/core.dart';

class CustomToast extends StatelessWidget {
  final String? title;
  final String description;
  final bool success;
  final VoidCallback onClose;

  const CustomToast({
    super.key,
    required this.title,
    required this.description,
    required this.onClose,
    this.success = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(Gaps.radiusMedium),
      child: Container(
        padding: const EdgeInsets.all(Gaps.paddingMedium),
        decoration: BoxDecoration(
          color: success ? colors.successContainer : colors.errorContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 12.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: success ? colors.success : colors.error,
                borderRadius: BorderRadius.circular(Gaps.radiusSmall),
              ),
              padding: const EdgeInsets.all(Gaps.paddingSmall),
              child: Icon(
                success ? Icons.check : Icons.error,
                color: Colors.white,
                size: Gaps.iconMedium,
              ),
            ),
            const SizedBox(width: Gaps.paddingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ??
                        (success
                            ? AppLocalizations.of(context).success
                            : AppLocalizations.of(context).error),
                    style: textStyles.bodyLarge?.copyWith(
                      color: success ? colors.onSuccess : colors.onError,
                    ),
                  ),
                  const SizedBox(height: Gaps.paddingSmall),
                  Text(
                    description,
                    style: textStyles.bodyMedium?.copyWith(
                      color: success ? colors.onSuccess : colors.onError,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: Gaps.paddingMedium),
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                color: colors.onSurface,
                size: Gaps.iconMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
