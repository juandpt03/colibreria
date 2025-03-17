import 'package:colibreria/src/core/config/intl/l10n.dart';
import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/searh/widgets/widgets.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatefulWidget {
  final SearchBooksSuccess state;
  final String query;

  const BookList({super.key, required this.state, required this.query});

  @override
  BookListState createState() => BookListState();
}

class BookListState extends State<BookList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      if (!widget.state.isLoading &&
          widget.state.searchResult.books.length <
              widget.state.searchResult.total) {
        context.read<SearchBooksBloc>().loadMoreResults(
          widget.query,
          widget.state.searchResult.page + 1,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final books = widget.state.searchResult.books;
    final textStyle = Theme.of(context).textTheme;

    final total = widget.state.searchResult.total;
    final query = widget.query;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GapY.medium(),
          Text(
            '${AppLocalizations.of(context).found} $total ${AppLocalizations.of(context).resultsFor} "$query"',
            style: textStyle.labelLarge,
          ),
          const GapY.small(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              final color = Colors.primaries[index % Colors.primaries.length];
              return BookCard(book: book, color: color);
            },
          ),
        ],
      ),
    );
  }
}
