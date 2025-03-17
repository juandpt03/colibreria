import 'package:colibreria/src/features/home/domain/entities/book.dart';
import 'package:equatable/equatable.dart';

/// Represents search results with pagination data
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

  /// Creates an empty search result with no books
  factory BookSearchResult.empty() =>
      const BookSearchResult(total: 0, page: 1, books: []);

  BookSearchResult copyWith({int? total, int? page, List<Book>? books}) {
    return BookSearchResult(
      total: total ?? this.total,
      page: page ?? this.page,
      books: books ?? this.books,
    );
  }
}
