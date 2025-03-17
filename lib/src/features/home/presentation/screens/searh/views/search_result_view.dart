import 'package:colibreria/src/core/config/intl/l10n.dart';
import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/searh/widgets/book_list.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';

class SearchResultsView extends StatelessWidget {
  final SearchBooksSuccess state;
  final String query;

  const SearchResultsView({
    super.key,
    required this.state,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final total = state.searchResult.total;

    return Padding(
      padding: const EdgeInsets.only(
        top: Gaps.paddingLarge,
        left: Gaps.paddingLarge,
        right: Gaps.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context).found} $total ${AppLocalizations.of(context).resultsFor} "$query"',
            style: textStyle.titleMedium,
          ),
          const GapY.small(),
          Expanded(child: BookList(state: state, query: query)),
        ],
      ),
    );
  }
}
