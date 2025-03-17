import 'package:equatable/equatable.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_books_event.dart';
part 'new_books_state.dart';

class NewBooksBloc extends Bloc<NewBooksEvent, NewBooksState> {
  final BooksUseCases _booksUseCases;

  NewBooksBloc({required BooksUseCases booksUseCases})
    : _booksUseCases = booksUseCases,
      super(NewBooksLoading()) {
    _handlers();
    fetchNewBooks();
  }
  void _handlers() {
    on<FetchNewBooks>(_onFetchNewBooks);
  }

  Future<void> _onFetchNewBooks(
    FetchNewBooks event,
    Emitter<NewBooksState> emit,
  ) async {
    emit(NewBooksLoading());

    final result = await _booksUseCases.getNewReleases();

    result.when(
      left: (error) => emit(NewBooksError(error: error)),
      right: (books) => emit(NewBooksSuccess(books: books)),
    );
  }

  void fetchNewBooks() => add(FetchNewBooks());
}
