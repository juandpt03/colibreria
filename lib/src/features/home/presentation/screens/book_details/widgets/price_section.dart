import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  final BookDetail book;

  const PriceSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        Divider(color: colors.outline.withValues(alpha: 0.2), height: 1),
        Padding(
          padding: const EdgeInsets.all(Gaps.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).price,
                style: textStyle.titleMedium,
              ),
              const GapY.small(),
              Row(
                children: [
                  Text(
                    book.price,
                    style: textStyle.headlineSmall?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed:
                        () => UrlLauncherHandler.launchUrl(
                          context: context,
                          url: book.url,
                        ),
                    text: AppLocalizations.of(context).buyNow,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Gaps.paddingLarge,
                      vertical: Gaps.small,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
