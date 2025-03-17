part of 'new_books_bloc.dart';

sealed class NewBooksState extends Equatable {
  const NewBooksState();

  @override
  List<Object> get props => [];

  T map<T>({
    required T Function(NewBooksLoading) loading,
    required T Function(NewBooksSuccess) success,
    required T Function(NewBooksError) error,
  }) {
    return switch (this) {
      NewBooksLoading s => loading(s),
      NewBooksSuccess s => success(s),
      NewBooksError s => error(s),
    };
  }

  void when({
    void Function(NewBooksLoading)? loading,
    void Function(NewBooksSuccess)? success,
    void Function(NewBooksError)? error,
  }) {
    switch (this) {
      case NewBooksLoading s:
        loading?.call(s);
        break;
      case NewBooksSuccess s:
        success?.call(s);
        break;
      case NewBooksError s:
        error?.call(s);
        break;
    }
  }
}

final class NewBooksLoading extends NewBooksState {}

final class NewBooksSuccess extends NewBooksState {
  final List<Book> books;

  const NewBooksSuccess({required this.books});

  NewBooksSuccess copyWith({List<Book>? books}) {
    return NewBooksSuccess(books: books ?? this.books);
  }

  @override
  List<Object> get props => [books];
}

final class NewBooksError extends NewBooksState {
  final AppException error;

  const NewBooksError({required this.error});

  @override
  List<Object> get props => [error];
}
