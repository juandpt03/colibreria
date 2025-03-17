import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';

class AboutBookTab extends StatelessWidget {
  final BookDetail book;

  const AboutBookTab({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(
        left: Gaps.medium,
        right: Gaps.medium,
        top: Gaps.small,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DetailItem(
              label: AppLocalizations.of(context).publisher,
              value: book.publisher,
            ),
            const GapY.small(),
            _DetailItem(
              label: AppLocalizations.of(context).year,
              value: book.year,
            ),
            const GapY.small(),
            _DetailItem(
              label: AppLocalizations.of(context).pages,
              value: book.pages,
            ),
            const GapY.small(),
            _DetailItem(
              label: AppLocalizations.of(context).isbn13,
              value: book.isbn13,
            ),
            const GapY.medium(),
            Text(
              AppLocalizations.of(context).description,
              style: textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const GapY.small(),
            Text(book.desc, style: textStyle.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Row(
      children: [
        Text(
          '$label: ',
          style: textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Text(value, style: textStyle.bodyMedium)),
      ],
    );
  }
}
