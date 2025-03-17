import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colibreria/src/core/core.dart';

import 'package:colibreria/src/features/home/presentation/screens/book_details/views/views.dart';
import 'package:colibreria/src/features/home/presentation/blocs/book_detail/book_detail_bloc.dart';

class BookDetailsScreen extends StatelessWidget {
  final String isbn13;

  const BookDetailsScreen({super.key, required this.isbn13});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              BookDetailBloc(booksUseCases: DI.sl.get())
                ..fetchBookDetail(isbn13),
      child: BookDetailsView(isbn13: isbn13),
    );
  }
}
