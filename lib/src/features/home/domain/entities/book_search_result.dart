import 'package:colibreria/src/features/home/domain/entities/book.dart';
import 'package:equatable/equatable.dart';

class BookSearchResult extends Equatable {
  final int total;
  final int page;
  final List<Book> books;

  const BookSearchResult({
    required this.total,
    required this.page,
    required this.books,
  });

  @override
  List<Object?> get props => [total, page, books];
}
