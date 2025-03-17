import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/search/views/views.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages search UI and handles interaction between search interface and SearchBooksBloc
class BookSearchDelegate extends SearchDelegate {
  final SearchBooksBloc searchBloc;

  /// Tracks last query to prevent redundant searches
  String? _lastSearchedQuery;

  BookSearchDelegate({required this.searchBloc});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          _lastSearchedQuery = null;
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Only trigger search if query is new
    if (query.isNotEmpty && query != _lastSearchedQuery) {
      _lastSearchedQuery = query;
      searchBloc.searchBooks(query);
    }
    return _SearchContent(searchBloc: searchBloc, query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty && query != _lastSearchedQuery) {
      _lastSearchedQuery = query;
      searchBloc.searchBooks(query);
    }
    return _SearchContent(
      searchBloc: searchBloc,
      query: query,
      onSearchSelected: (selectedQuery) {
        query = selectedQuery;
        searchBloc.searchBooks(selectedQuery);
        showResults(context);
      },
    );
  }
}

/// widget that displays search results or history based on current state
class _SearchContent extends StatelessWidget {
  final SearchBooksBloc searchBloc;
  final String query;
  final void Function(String)? onSearchSelected;
  const _SearchContent({
    required this.searchBloc,
    required this.query,
    this.onSearchSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksBloc, SearchBooksState>(
      bloc: searchBloc,
      builder: (context, state) {
        return state.map(
          loading: (_) => const CustomLoading(),
          success:
              (state) => SearchContentSuccessView(
                state: state,
                query: query,
                onSearchSelected: onSearchSelected,
              ),
          error:
              (state) => CustomErrorWidget(
                error: state.error,
                onRetry: () => searchBloc.searchBooks(query),
              ),
        );
      },
    );
  }
}
