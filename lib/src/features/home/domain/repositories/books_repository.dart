import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

abstract class BooksRepository {
  Future<Either<AppException, BookSearchResult>> searchBooks(
    String query, {
    int page = 1,
  });

  Future<Either<AppException, List<Book>>> getNewReleases();

  Future<Either<AppException, BookDetail>> getBookDetails(String isbn13);
}
