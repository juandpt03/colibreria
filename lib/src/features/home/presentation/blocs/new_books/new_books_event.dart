part of 'new_books_bloc.dart';

sealed class NewBooksEvent extends Equatable {
  const NewBooksEvent();

  @override
  List<Object> get props => [];
}

final class FetchNewBooks extends NewBooksEvent {}
