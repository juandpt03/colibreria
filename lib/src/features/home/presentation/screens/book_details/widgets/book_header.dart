import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';

class BookHeader extends StatelessWidget {
  final BookDetail book;

  const BookHeader({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(Gaps.medium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BookCover(book: book),
          const GapX.medium(),
          Expanded(
            child: Column(
              spacing: Gaps.small,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        book.authors,
                        style: textStyle.titleSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const GapX.small(),
                    Icon(Icons.verified, color: colors.primary, size: 16),
                  ],
                ),

                if (book.rating.isNotEmpty) _RatingInfo(book: book),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookCover extends StatelessWidget {
  final BookDetail book;

  const _BookCover({required this.book});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.sizeOf(context);

    final color =
        Colors.primaries[book.isbn13.hashCode % 10 % Colors.primaries.length];

    return Hero(
      tag: book.isbn13,
      child: Container(
        height: size.height * 0.2,
        width: size.width * 0.3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Gaps.radiusMedium),
          boxShadow: [
            BoxShadow(
              color: colors.shadow.withValues(alpha: 0.3),
              blurRadius: 5,
              offset: const Offset(6, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Gaps.radiusMedium),
          child: CachedNetworkImage(
            imageUrl: book.image,
            fit: BoxFit.cover,
            placeholder: (context, url) => CustomLoading(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fadeInDuration: Duration.zero,
          ),
        ),
      ),
    );
  }
}

class _RatingInfo extends StatelessWidget {
  final BookDetail book;

  const _RatingInfo({required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 18),
        const GapX.small(),
        Text(
          book.rating,
          style: textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
