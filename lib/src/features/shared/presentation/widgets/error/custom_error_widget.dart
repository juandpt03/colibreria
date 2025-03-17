import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final AppException error;
  final String? buttonText;
  final VoidCallback? onRetry;
  final bool showRetryButton;

  const CustomErrorWidget({
    super.key,
    required this.error,
    this.buttonText,
    this.onRetry,
    this.showRetryButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Gaps.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: Gaps.iconLarge * 2,
              color: colors.error,
            ),
            const GapY.small(),
            Text(
              error.message,
              style: textStyle.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (showRetryButton) ...[
              const GapY.medium(),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(buttonText ?? AppLocalizations.of(context).retry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
