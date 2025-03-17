import 'package:bloc_test/bloc_test.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/home/presentation/blocs/new_books/new_books_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Define a mock for BooksUseCases using mocktail.
class MockBooksUseCases extends Mock implements BooksUseCases {}

void main() {
  // Sample test data for books.
  final mockBooks = [
    Book(
      title: 'Flutter in Action',
      subtitle: 'A hands-on guide',
      isbn13: '9781617296147',
      price: '\$39.99',
      image: 'https://example.com/image.jpg',
      url: 'https://example.com/book',
    ),
    Book(
      title: 'Dart Programming',
      subtitle: 'Complete reference',
      isbn13: '9781617297890',
      price: '\$29.99',
      image: 'https://example.com/image2.jpg',
      url: 'https://example.com/book2',
    ),
  ];

  // Sample error data.
  final mockError = AppException(
    message: 'Network error',
    error: true,
    exception: Exception('Network error'),
  );

  group('NewBooksBloc', () {
    late MockBooksUseCases mockBooksUseCases;

    setUp(() {
      mockBooksUseCases = MockBooksUseCases();

      // Default configuration for both auto-fetch and manual fetch.
      when(
        () => mockBooksUseCases.getNewReleases(),
      ).thenAnswer((_) async => Either.right(mockBooks));
    });

    // Test 1:
    // When fetchNewBooks() is called manually, it should emit [NewBooksLoading, NewBooksSuccess].
    // The 'skip: 2' ignores the two initial states emitted by the auto-fetch in the constructor.
    blocTest<NewBooksBloc, NewBooksState>(
      'Test 1: emits [NewBooksLoading, NewBooksSuccess] when calling fetchNewBooks() manually',
      build: () => NewBooksBloc(booksUseCases: mockBooksUseCases),
      skip: 2, // Skips the auto-fetch states
      act: (bloc) => bloc.fetchNewBooks(),
      expect:
          () => [
            isA<NewBooksLoading>(),
            isA<NewBooksSuccess>().having(
              (state) => state.books,
              'books',
              mockBooks,
            ),
          ],
    );

    // Test 2:
    // When the manual fetch fails, the bloc should emit [NewBooksLoading, NewBooksError].
    blocTest<NewBooksBloc, NewBooksState>(
      'Test 2: emits [NewBooksLoading, NewBooksError] if manual fetch fails',
      build: () {
        when(
          () => mockBooksUseCases.getNewReleases(),
        ).thenAnswer((_) async => Either.left(mockError));
        return NewBooksBloc(booksUseCases: mockBooksUseCases);
      },
      skip: 2, // Skip the auto-fetch states.
      act: (bloc) => bloc.fetchNewBooks(),
      expect:
          () => [
            isA<NewBooksLoading>(),
            isA<NewBooksError>().having(
              (state) => state.error,
              'error',
              mockError,
            ),
          ],
    );

    // Test 3:
    // Verify that the map() function returns the correct value for each state.
    test(
      'Test 3: map function should return the correct value for each state',
      () {
        // For Loading state.
        final loadingState = NewBooksLoading();
        final loadingResult = loadingState.map(
          loading: (_) => 'loading',
          success: (_) => 'success',
          error: (_) => 'error',
        );
        expect(loadingResult, 'loading');

        // For Success state.
        final successState = NewBooksSuccess(books: mockBooks);
        final successResult = successState.map(
          loading: (_) => 'loading',
          success: (_) => 'success',
          error: (_) => 'error',
        );
        expect(successResult, 'success');

        // For Error state.
        final errorState = NewBooksError(error: mockError);
        final errorResult = errorState.map(
          loading: (_) => 'loading',
          success: (_) => 'success',
          error: (_) => 'error',
        );
        expect(errorResult, 'error');
      },
    );

    // Test 4:
    // Verify that the when() function calls the correct callback for each state.
    test(
      'Test 4: when function should call the correct callback for each state',
      () {
        String called = '';

        // Test with Loading state.
        final loadingState = NewBooksLoading();
        loadingState.when(
          loading: (_) => called = 'loading',
          success: (_) => called = 'success',
          error: (_) => called = 'error',
        );
        expect(called, 'loading');

        // Test with Success state.
        called = '';
        final successState = NewBooksSuccess(books: mockBooks);
        successState.when(
          loading: (_) => called = 'loading',
          success: (_) => called = 'success',
          error: (_) => called = 'error',
        );
        expect(called, 'success');

        // Test with Error state.
        called = '';
        final errorState = NewBooksError(error: mockError);
        errorState.when(
          loading: (_) => called = 'loading',
          success: (_) => called = 'success',
          error: (_) => called = 'error',
        );
        expect(called, 'error');
      },
    );

    // Test 5:
    // Verify that copyWith on NewBooksSuccess returns the correct state.
    test('Test 5: NewBooksSuccess copyWith returns the correct state', () {
      final originalState = NewBooksSuccess(books: mockBooks);

      final newBooks = [
        Book(
          title: 'Advanced Flutter',
          subtitle: 'Expert techniques',
          isbn13: '9781617298765',
          price: '\$45.99',
          image: 'https://example.com/image3.jpg',
          url: 'https://example.com/book3',
        ),
      ];

      final newState = originalState.copyWith(books: newBooks);

      // Check that newState has the updated books.
      expect(newState.books, newBooks);

      // Ensure that the original state remains unchanged.
      expect(originalState.books, mockBooks);

      // Calling copyWith with no parameters should return an equivalent state.
      final sameState = originalState.copyWith();
      expect(sameState.books, originalState.books);
    });
  });
}
