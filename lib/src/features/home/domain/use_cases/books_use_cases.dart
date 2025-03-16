import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

class BooksUseCases {
  final BooksRepository _repository;

  BooksUseCases({required BooksRepository repository})
    : _repository = repository;

  Future<Either<AppException, BookSearchResult>> searchBooks(
    String query, {
    int page = 1,
  }) => _repository.searchBooks(query, page: page);

  Future<Either<AppException, List<Book>>> getNewReleases() =>
      _repository.getNewReleases();

  Future<Either<AppException, BookDetail>> getBookDetails(String isbn13) =>
      _repository.getBookDetails(isbn13);
}
