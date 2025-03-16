import 'package:colibreria/src/features/home/data/models/book_model.dart';
import 'package:colibreria/src/features/home/domain/entities/book_search_result.dart';

class BookSearchResultModel extends BookSearchResult {
  const BookSearchResultModel({
    required super.total,
    required super.page,
    required super.books,
  });

  factory BookSearchResultModel.fromJson(Map<String, dynamic> json) {
    final List<BookModel> books = [];
    if (json['books'] != null) {
      for (var bookJson in json['books']) {
        books.add(BookModel.fromJson(bookJson));
      }
    }

    return BookSearchResultModel(
      total: int.tryParse(json['total'] ?? '0') ?? 0,
      page: int.tryParse(json['page'] ?? '1') ?? 1,
      books: books,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total.toString(),
      'page': page.toString(),
      'books': (books as List<BookModel>).map((book) => book.toJson()).toList(),
    };
  }
}
