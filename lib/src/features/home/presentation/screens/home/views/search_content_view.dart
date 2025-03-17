import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/views/views.dart';
import 'package:flutter/material.dart';

class SearchContentSuccessView extends StatelessWidget {
  final SearchBooksSuccess state;
  final String query;

  final void Function(String)? onSearchSelected;

  const SearchContentSuccessView({
    super.key,
    required this.state,
    required this.query,

    this.onSearchSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty && state.searchHistory.isNotEmpty) {
      return SearchHistoryView(
        searchHistory: state.searchHistory,
        onSearchSelected: onSearchSelected,
      );
    }
    if (query.isEmpty) {
      return SearchHistoryView(
        searchHistory: state.searchHistory,
        onSearchSelected: onSearchSelected,
      );
    }

    if (state.searchResult.books.isNotEmpty) {
      return SearchResultsView(state: state, query: query);
    }

    return EmptyResultsView(query: query);
  }
}
