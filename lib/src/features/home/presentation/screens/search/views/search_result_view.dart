import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/search/widgets/book_list.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Gaps.paddingMedium),
        child: BookList(state: state, query: query),
      ),
    );
  }
}
