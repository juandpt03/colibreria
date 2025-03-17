part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();
  
  @override
  List<Object> get props => [];
}

final class BookInitial extends BookState {}
