import 'package:cached_network_image/cached_network_image.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color =
        Colors.primaries[book.isbn13.hashCode % 10 % Colors.primaries.length];

    return InkWell(
      onTap:
          () => context.pushNamed(
            AppRoute.bookDetail.name,
            queryParameters: {'isbn13': book.isbn13},
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,

                borderRadius: BorderRadius.circular(Gaps.radiusMedium),
              ),
              child: CachedNetworkImage(
                imageUrl: book.image,
                fit: BoxFit.cover,
                placeholder: (context, url) => CustomLoading(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fadeInDuration: Duration.zero,
              ),
            ),
          ),
          const GapY.small(),
          Text(
            book.title.isNotEmpty
                ? book.title
                : AppLocalizations.of(context).noTitleAvailable,
            style: textStyle.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            book.price.isNotEmpty
                ? book.price
                : AppLocalizations.of(context).priceNotAvailable,
            style: textStyle.labelMedium,
          ),
        ],
      ),
    );
  }
}
