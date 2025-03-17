import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibreria/src/core/config/intl/l10n.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final Color color;

  const BookCard({super.key, required this.book, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Gaps.small),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BookCover(color: color, book: book),
          const GapX.small(),
          Expanded(child: _BookInfo(book: book)),
        ],
      ),
    );
  }
}

class _BookInfo extends StatelessWidget {
  final Book book;

  const _BookInfo({required this.book});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          book.title.isNotEmpty
              ? book.title
              : AppLocalizations.of(context).noTitleAvailable,
          style: textStyle.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const GapY.small(),
        Text(
          book.subtitle.isNotEmpty
              ? book.subtitle
              : AppLocalizations.of(context).noDescriptionAvailable,
          style: textStyle.bodyMedium?.copyWith(
            color: colors.onSurface.withValues(alpha: 0.7),
          ),
          maxLines: 3,
        ),
        Text(
          book.price.isNotEmpty
              ? book.price
              : AppLocalizations.of(context).priceNotAvailable,
          style: textStyle.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),

        Text(
          book.isbn13.isNotEmpty
              ? 'ISBN-13 ${book.isbn13}'
              : AppLocalizations.of(context).isbnNotAvailable,
          style: textStyle.bodyMedium?.copyWith(
            color: colors.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

class _BookCover extends StatelessWidget {
  final Color color;
  final Book book;

  const _BookCover({required this.color, required this.book});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.3,
      height: size.height * 0.2,
      child: CachedNetworkImage(
        imageBuilder:
            (context, imageProvider) => Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        imageUrl: book.image,
        fit: BoxFit.contain,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fadeInDuration: Duration.zero,
        placeholder: (context, url) => CustomLoading(),
      ),
    );
  }
}
