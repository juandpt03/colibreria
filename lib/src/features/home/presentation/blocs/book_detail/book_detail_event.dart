part of 'book_detail_bloc.dart';

sealed class BookDetailEvent extends Equatable {
  const BookDetailEvent();

  @override
  List<Object> get props => [];
}

final class FetchBookDetail extends BookDetailEvent {
  final String isbn13;

  const FetchBookDetail({required this.isbn13});

  @override
  List<Object> get props => [isbn13];
}
