import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

class BooksUseCases {
  final BooksRepository _repository;

  BooksUseCases({required BooksRepository repository})
    : _repository = repository;

  /// Searches books with optional pagination support
  /// Returns a [BookSearchResult] wrapped in Either for error handling
  Future<Either<AppException, BookSearchResult>> searchBooks(
    String query, {
    int page = 1,
  }) => _repository.searchBooks(query, page: page);

  /// Fetches a list of newly released books

  Future<Either<AppException, List<Book>>> getNewReleases() =>
      _repository.getNewReleases();

  /// Fetches a BookDetail by its ISBN13
  ///
  Future<Either<AppException, BookDetail>> getBookDetails(String isbn13) =>
      _repository.getBookDetails(isbn13);
}
