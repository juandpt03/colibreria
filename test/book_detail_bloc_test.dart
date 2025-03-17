import 'package:bloc_test/bloc_test.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/home/presentation/blocs/book_detail/book_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Define a mock for BooksUseCases
class MockBooksUseCases extends Mock implements BooksUseCases {}

void main() {
  // Sample test data
  final mockBookDetail = BookDetail(
    title: 'Flutter in Action',
    subtitle: 'A hands-on guide',
    authors: 'Eric Windmill',
    publisher: 'Manning Publications',
    isbn10: '1617296147',
    isbn13: '9781617296147',
    pages: '368',
    year: '2020',
    rating: '4.5',
    desc: 'A comprehensive guide to Flutter development',
    price: '\$39.99',
    image: 'https://example.com/image.jpg',
    url: 'https://example.com/book',
    pdfs: [Pdf(name: 'Sample PDF', url: 'https://example.com/sample.pdf')],
  );

  final mockError = AppException(
    message: 'Network error',
    error: true,
    exception: Exception('Network error'),
  );

  group('BookDetailBloc', () {
    late MockBooksUseCases mockBooksUseCases;

    setUp(() {
      mockBooksUseCases = MockBooksUseCases();

      // Default configuration for successful fetch
      when(
        () => mockBooksUseCases.getBookDetails('9781617296147'),
      ).thenAnswer((_) async => Either.right(mockBookDetail));
    });

    // Test 1: Initial state should be BookLoading
    test('Test 1: initial state should be BookLoading', () {
      final bloc = BookDetailBloc(booksUseCases: mockBooksUseCases);
      expect(bloc.state, isA<BookLoading>());
    });

    // Test 2: Emits [BookLoading, BookSuccess] when fetch is successful
    blocTest<BookDetailBloc, BookDetailState>(
      'Test 2: emits [BookLoading, BookSuccess] when fetchBookDetail is successful',
      build: () => BookDetailBloc(booksUseCases: mockBooksUseCases),
      act: (bloc) => bloc.fetchBookDetail('9781617296147'),
      expect:
          () => [
            isA<BookLoading>(),
            isA<BookSuccess>().having(
              (state) => state.book,
              'book',
              mockBookDetail,
            ),
          ],
    );

    // Test 3: Emits [BookLoading, BookError] when fetch fails
    blocTest<BookDetailBloc, BookDetailState>(
      'Test 3: emits [BookLoading, BookError] when fetchBookDetail fails',
      build: () {
        when(
          () => mockBooksUseCases.getBookDetails('9781617296147'),
        ).thenAnswer((_) async => Either.left(mockError));
        return BookDetailBloc(booksUseCases: mockBooksUseCases);
      },
      act: (bloc) => bloc.fetchBookDetail('9781617296147'),
      expect:
          () => [
            isA<BookLoading>(),
            isA<BookError>().having((state) => state.error, 'error', mockError),
          ],
    );

    // Test 4: Test map() method on states
    test(
      'Test 4: map function should return the correct value for each state',
      () {
        // For Loading state
        final loadingState = BookLoading();
        final loadingResult = loadingState.map(
          loading: (_) => 'loading',
          success: (_) => 'success',
          error: (_) => 'error',
        );
        expect(loadingResult, 'loading');

        // For Success state
        final successState = BookSuccess(book: mockBookDetail);
        final successResult = successState.map(
          loading: (_) => 'loading',
          success: (_) => 'success',
          error: (_) => 'error',
        );
        expect(successResult, 'success');

        // For Error state
        final errorState = BookError(error: mockError);
        final errorResult = errorState.map(
          loading: (_) => 'loading',
          success: (_) => 'success',
          error: (_) => 'error',
        );
        expect(errorResult, 'error');
      },
    );

    // Test 5: Test props for equality checks
    test('Test 5: states with the same properties should be equal', () {
      // For Success state
      final successState1 = BookSuccess(book: mockBookDetail);
      final successState2 = BookSuccess(book: mockBookDetail);
      expect(successState1 == successState2, true);

      // For Error state
      final errorState1 = BookError(error: mockError);
      final errorState2 = BookError(error: mockError);
      expect(errorState1 == errorState2, true);
    });
  });
}
