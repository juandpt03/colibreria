import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchErrorView extends StatelessWidget {
  final AppException error;
  final String query;

  const SearchErrorView({super.key, required this.error, required this.query});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final searchBloc = context.read<SearchBooksBloc>();

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
            const GapY.medium(),
            ElevatedButton(
              onPressed:
                  query.isNotEmpty ? () => searchBloc.searchBooks(query) : null,
              child: Text(AppLocalizations.of(context).retry),
            ),
          ],
        ),
      ),
    );
  }
}
