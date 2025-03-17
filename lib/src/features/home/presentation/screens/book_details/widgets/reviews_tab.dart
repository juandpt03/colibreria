import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  final BookDetail book;

  const ReviewsTab({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Center(
      child: Text(
        AppLocalizations.of(context).noReviewsYet,
        style: textStyle.titleMedium,
      ),
    );
  }
}
