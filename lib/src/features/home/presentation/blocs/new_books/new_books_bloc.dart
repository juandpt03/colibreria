import 'package:equatable/equatable.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_books_event.dart';
part 'new_books_state.dart';

/// Manages the state of new book releases
class NewBooksBloc extends Bloc<NewBooksEvent, NewBooksState> {
  final BooksUseCases _booksUseCases;

  NewBooksBloc({required BooksUseCases booksUseCases})
    : _booksUseCases = booksUseCases,
      super(NewBooksLoading()) {
    _eventHandlers();
    fetchNewBooks();
  }

  /// Initializes the event handlers for the bloc
  void _eventHandlers() {
    on<FetchNewBooks>(_onFetchNewBooks);
  }

  /// Handles the FetchNewBooks event
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

  /// dispatches the FetchNewBooks event to fetch new books
  void fetchNewBooks() => add(FetchNewBooks());
}
