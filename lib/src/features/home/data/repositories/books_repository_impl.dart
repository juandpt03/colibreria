import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksDatasource remoteDatasource;
  final BooksDatasource? localDatasource;

  BooksRepositoryImpl({required this.remoteDatasource, this.localDatasource});

  @override
  Future<Either<AppException, BookDetail>> getBookDetails(String isbn13) =>
      remoteDatasource.getBookDetails(isbn13);

  @override
  Future<Either<AppException, List<Book>>> getNewReleases() =>
      remoteDatasource.getNewReleases();

  @override
  Future<Either<AppException, BookSearchResult>> searchBooks(
    String query, {
    int page = 1,
  }) => remoteDatasource.searchBooks(query, page: page);
}
