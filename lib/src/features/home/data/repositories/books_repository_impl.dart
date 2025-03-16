import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksDatasource datasource;

  BooksRepositoryImpl({required this.datasource});

  @override
  Future<Either<AppException, BookDetail>> getBookDetails(String isbn13) =>
      datasource.getBookDetails(isbn13);

  @override
  Future<Either<AppException, List<Book>>> getNewReleases() =>
      datasource.getNewReleases();

  @override
  Future<Either<AppException, BookSearchResult>> searchBooks(
    String query, {
    int page = 1,
  }) => datasource.searchBooks(query, page: page);
}
