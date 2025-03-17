part of 'book_detail_bloc.dart';

sealed class BookDetailState extends Equatable {
  const BookDetailState();

  @override
  List<Object> get props => [];

  /// Maps the current state to a specific type using the functional programming style
  T map<T>({
    required T Function(BookLoading) loading,
    required T Function(BookSuccess) success,
    required T Function(BookError) error,
  }) {
    return switch (this) {
      BookLoading() => loading(this as BookLoading),
      BookSuccess() => success(this as BookSuccess),
      BookError() => error(this as BookError),
    };
  }
}

final class BookLoading extends BookDetailState {}

final class BookSuccess extends BookDetailState {
  final BookDetail book;

  const BookSuccess({required this.book});

  @override
  List<Object> get props => [book];
}

final class BookError extends BookDetailState {
  final AppException error;

  const BookError({required this.error});

  @override
  List<Object> get props => [error];
}

/// Extension to get the book from the state
extension BookDetailStateX on BookDetailState {
  BookDetail? get book => switch (this) {
    BookSuccess() => (this as BookSuccess).book,
    BookError() => null,
    BookLoading() => null,
  };
}
