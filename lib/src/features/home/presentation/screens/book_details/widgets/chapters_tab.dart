import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';

class ChaptersTab extends StatelessWidget {
  final BookDetail book;

  const ChaptersTab({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final pdfs = book.pdfs;
    final pdfCount = pdfs?.length ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GapY.small(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Gaps.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).chapters,
                style: textStyle.titleMedium,
              ),
              Text(
                "($pdfCount)",
                style: textStyle.titleMedium?.copyWith(color: colors.primary),
              ),
            ],
          ),
        ),
        const GapY.small(),
        if (pdfs != null && pdfs.isNotEmpty)
          Expanded(
            child: ListView.separated(
              itemCount: pdfs.length,
              separatorBuilder: (_, __) => const GapY.small(),
              itemBuilder: (context, index) {
                final pdf = pdfs[index];
                final number = (index + 1).toString().padLeft(2, '0');

                return _SectionItem(
                  title: pdf.name,
                  subtitle:
                      '${AppLocalizations.of(context).chapter} ${index + 1}',
                  duration: '',
                  number: number,
                  isLocked: false,
                  url: pdf.url,
                );
              },
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.all(Gaps.medium),
            child: Center(
              child: Text(
                AppLocalizations.of(context).noChaptersAvailableForThisBook,
                style: textStyle.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

class _SectionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String number;
  final bool isLocked;
  final String url;

  const _SectionItem({
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.number,
    required this.isLocked,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => UrlLauncherHandler.launchUrl(context: context, url: url),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Gaps.medium),
        padding: const EdgeInsets.all(Gaps.medium),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(Gaps.radiusMedium),
          border: Border.all(
            color: colors.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(Gaps.radiusSmall),
              ),
              child: Text(
                number,
                style: textStyle.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const GapX.medium(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textStyle.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: textStyle.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (duration.isNotEmpty)
              Text(
                duration,
                style: textStyle.bodySmall?.copyWith(color: colors.primary),
              ),
            if (isLocked)
              Icon(Icons.lock_outline, color: colors.onSurfaceVariant)
            else
              Icon(Icons.play_circle_filled, color: colors.primary),
          ],
        ),
      ),
    );
  }
}
