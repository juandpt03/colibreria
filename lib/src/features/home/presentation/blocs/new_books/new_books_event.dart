part of 'new_books_bloc.dart';

sealed class NewBooksEvent {
  const NewBooksEvent();
}

final class FetchNewBooks extends NewBooksEvent {}
