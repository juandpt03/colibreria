import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_detail_event.dart';
part 'book_detail_state.dart';

//fetch book details
class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final BooksUseCases _booksUseCases;

  BookDetailBloc({required BooksUseCases booksUseCases})
    : _booksUseCases = booksUseCases,
      super(BookLoading()) {
    _eventHandlers();
  }

  /// Initializes the event handlers for the bloc
  void _eventHandlers() {
    on<FetchBookDetail>(_onFetchBookDetail);
  }

  /// Handles the FetchBookDetail event
  Future<void> _onFetchBookDetail(
    FetchBookDetail event,
    Emitter<BookDetailState> emit,
  ) async {
    emit(BookLoading());

    final result = await _booksUseCases.getBookDetails(event.isbn13);

    result.when(
      left: (error) => emit(BookError(error: error)),
      right: (book) => emit(BookSuccess(book: book)),
    );
  }

  /// Dispatches the FetchBookDetail event to fetch book details
  void fetchBookDetail(String isbn13) => add(FetchBookDetail(isbn13: isbn13));
}
