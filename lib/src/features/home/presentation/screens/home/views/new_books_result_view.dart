import 'package:colibreria/src/core/config/intl/l10n.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/home/presentation/blocs/new_books/new_books_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/home/widgets/book_item.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBooksResultView extends StatelessWidget {
  const NewBooksResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBooksBloc, NewBooksState>(
      builder: (context, state) {
        return state.map(
          loading: (_) => CustomLoading(),
          success: (state) => _BooksGrid(books: state.books),
          error:
              (state) => CustomErrorWidget(
                error: state.error,
                buttonText: AppLocalizations.of(context).retry,
                onRetry: () => context.read<NewBooksBloc>().fetchNewBooks(),
              ),
        );
      },
    );
  }
}

class _BooksGrid extends StatelessWidget {
  final List<Book> books;
  const _BooksGrid({required this.books});

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return Center(child: Text(AppLocalizations.of(context).noBooksFound));
    }

    return Padding(
      padding: const EdgeInsets.all(Gaps.medium),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Gaps.medium,
          mainAxisSpacing: Gaps.medium,
          childAspectRatio: 0.6,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];

          return BookItem(book: book);
        },
      ),
    );
  }
}
