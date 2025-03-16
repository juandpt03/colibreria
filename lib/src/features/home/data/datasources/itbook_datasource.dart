import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/data/data.dart';

import 'package:colibreria/src/features/home/domain/domain.dart';

class ItbookDatasource implements BooksDatasource {
  final HttpClient client;

  ItbookDatasource({required this.client});
  @override
  Future<Either<AppException, BookDetail>> getBookDetails(String isbn13) async {
    try {
      final response = await client.request(
        HttpMethod.get,
        path: ApiEndpoints.bookDetails(isbn13),
      );

      final book = BookDetailModel.fromJson(response.data);
      return Either.right(book);
    } catch (e) {
      return Either.left(AppException.fromException(e));
    }
  }

  @override
  Future<Either<AppException, List<Book>>> getNewReleases() async {
    try {
      final response = await client.request(
        HttpMethod.get,
        path: ApiEndpoints.newReleases,
      );

      final books = BookModel.fromJsonList(response.data);
      return Either.right(books);
    } catch (e) {
      return Either.left(AppException.fromException(e));
    }
  }

  @override
  Future<Either<AppException, BookSearchResult>> searchBooks(
    String query, {
    int page = 1,
  }) async {
    try {
      final response = await client.request(
        HttpMethod.get,
        path: ApiEndpoints.searchBooks(query, page: page),
      );
      final bookSearchResult = BookSearchResultModel.fromJson(response.data);

      return Either.right(bookSearchResult);
    } catch (e) {
      return Either.left(AppException.fromException(e));
    }
  }
}
