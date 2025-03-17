import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/home/presentation/blocs/book_detail/book_detail_bloc.dart';
import 'package:colibreria/src/features/home/presentation/screens/book_details/widgets/widgets.dart';
import 'package:colibreria/src/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  final String isbn13;
  const BookDetailsView({super.key, required this.isbn13});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BookDetailBloc>().state;
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).bookDetails,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed:
                () =>
                    ShareHandler.shareBook(context: context, book: state.book),
          ),
          IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: state.map(
          loading: (_) => const CustomLoading(),
          success: (state) => _SuccessView(book: state.book),
          error:
              (state) => CustomErrorWidget(
                error: state.error,
                onRetry:
                    () =>
                        context.read<BookDetailBloc>().fetchBookDetail(isbn13),
              ),
        ),
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  final BookDetail book;

  const _SuccessView({required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookHeader(book: book),
        TabSection(book: book),
        PriceSection(book: book),
      ],
    );
  }
}
