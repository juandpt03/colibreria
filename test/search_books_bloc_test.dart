import 'package:bloc_test/bloc_test.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';
import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

// Define mocks using mocktail
class MockBooksUseCases extends Mock implements BooksUseCases {}

class MockDebouncer extends Mock implements Debouncer {}

class MockStorage extends Mock implements Storage {}

void main() {
  // Set up the mock storage for hydrated bloc
  late Storage hydratedStorage;

  setUp(() {
    hydratedStorage = MockStorage();
    // Return empty JSON by default for any key
    when(() => hydratedStorage.read(any())).thenReturn({});
    HydratedBloc.storage = hydratedStorage;
  });

  // Sample test data
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

  final mockSearchResult = BookSearchResult(
    total: 2,
    page: 1,
    books: mockBooks,
  );
  final mockError = AppException(
    message: 'Network error',
    error: true,
    exception: Exception('Network error'),
  );

  group('SearchBooksBloc', () {
    late SearchBooksBloc searchBooksBloc;
    late MockBooksUseCases mockBooksUseCases;
    late MockDebouncer mockDebouncer;

    setUp(() {
      mockBooksUseCases = MockBooksUseCases();
      mockDebouncer = MockDebouncer();

      // Default behavior: execute debounced action immediately for testing purposes
      when(() => mockDebouncer.run(any())).thenAnswer((invocation) {
        final callback = invocation.positionalArguments.first as Function();
        callback();
      });

      // For the write method of storage
      when(
        () => hydratedStorage.write(any(), any()),
      ).thenAnswer((_) async => true);

      searchBooksBloc = SearchBooksBloc(
        booksUseCases: mockBooksUseCases,
        debouncer: mockDebouncer,
      );
    });
    // 1. Test initial state
    test(
      'initial state should be SearchBooksSuccess with empty history or cached history',
      () {
        // The initial state should be SearchBooksSuccess
        expect(searchBooksBloc.state, isA<SearchBooksSuccess>());

        // The searchHistory should either be empty (if no cache) or contain items (if cached)
        // Both cases are valid initial states when using HydratedBloc
        expect(searchBooksBloc.state.searchHistory, isA<List<String>>());
      },
    );

    // 2. Test successful search
    blocTest<SearchBooksBloc, SearchBooksState>(
      'emits [SearchBooksLoading, SearchBooksSuccess] when search is successful',
      build: () {
        when(
          () => mockBooksUseCases.searchBooks('flutter'),
        ).thenAnswer((_) async => Either.right(mockSearchResult));
        return searchBooksBloc;
      },
      act: (bloc) => bloc.searchBooks('flutter'),
      expect:
          () => [
            isA<SearchBooksLoading>(),
            isA<SearchBooksSuccess>()
                .having(
                  (state) => state.searchResult,
                  'searchResult',
                  mockSearchResult,
                )
                .having((state) => state.searchHistory, 'searchHistory', [
                  'flutter',
                ]),
          ],
    );

    // 3. Test failed search
    blocTest<SearchBooksBloc, SearchBooksState>(
      'emits [SearchBooksLoading, SearchBooksError] when search fails',
      build: () {
        when(
          () => mockBooksUseCases.searchBooks('flutter'),
        ).thenAnswer((_) async => Either.left(mockError));
        return searchBooksBloc;
      },
      act: (bloc) => bloc.searchBooks('flutter'),
      expect:
          () => [
            isA<SearchBooksLoading>(),
            isA<SearchBooksError>()
                .having((state) => state.error, 'error', mockError)
                .having((state) => state.searchHistory, 'searchHistory', [
                  'flutter',
                ]),
          ],
    );

    // 4. Test load more results
    blocTest<SearchBooksBloc, SearchBooksState>(
      'appends new books when loading more results',
      seed:
          () => SearchBooksSuccess(
            searchResult: mockSearchResult,
            searchHistory: ['flutter'],
          ),
      build: () {
        final moreBooks = [
          Book(
            title: 'Advanced Flutter',
            subtitle: 'Expert techniques',
            isbn13: '9781617298765',
            price: '\$45.99',
            image: 'https://example.com/image3.jpg',
            url: 'https://example.com/book3',
          ),
        ];

        final moreResults = BookSearchResult(
          total: 3,
          page: 2,
          books: moreBooks,
        );

        when(
          () => mockBooksUseCases.searchBooks('flutter', page: 2),
        ).thenAnswer((_) async => Either.right(moreResults));

        return searchBooksBloc;
      },
      act: (bloc) => bloc.loadMoreResults('flutter', 2),
      expect:
          () => [
            isA<SearchBooksSuccess>().having(
              (state) => state.isLoading,
              'isLoading',
              true,
            ),
            isA<SearchBooksSuccess>()
                .having(
                  (state) => state.searchResult.books.length,
                  'books count',
                  3,
                )
                .having((state) => state.searchResult.page, 'page', 2)
                .having((state) => state.isLoading, 'isLoading', false),
          ],
    );

    // 5. Test load more results failure
    blocTest<SearchBooksBloc, SearchBooksState>(
      'emits [SearchBooksSuccess with isLoading=true, SearchBooksError] when loading more fails',
      seed:
          () => SearchBooksSuccess(
            searchResult: mockSearchResult,
            searchHistory: ['flutter'],
          ),
      build: () {
        when(
          () => mockBooksUseCases.searchBooks('flutter', page: 2),
        ).thenAnswer((_) async => Either.left(mockError));
        return searchBooksBloc;
      },
      act: (bloc) => bloc.loadMoreResults('flutter', 2),
      expect:
          () => [
            isA<SearchBooksSuccess>().having(
              (state) => state.isLoading,
              'isLoading',
              true,
            ),
            isA<SearchBooksError>().having(
              (state) => state.error,
              'error',
              mockError,
            ),
          ],
    );

    // 6. Test search history limit
    blocTest<SearchBooksBloc, SearchBooksState>(
      'limits search history to 5 items',
      seed:
          () => SearchBooksSuccess(
            searchResult: BookSearchResult(total: 0, page: 1, books: []),
            searchHistory: ['query1', 'query2', 'query3', 'query4', 'query5'],
          ),
      build: () {
        when(
          () => mockBooksUseCases.searchBooks('query6'),
        ).thenAnswer((_) async => Either.right(mockSearchResult));
        return searchBooksBloc;
      },
      act: (bloc) => bloc.searchBooks('query6'),
      expect:
          () => [
            isA<SearchBooksLoading>(),
            isA<SearchBooksSuccess>().having(
              (state) => state.searchHistory,
              'search history',
              ['query6', 'query1', 'query2', 'query3', 'query4'],
            ),
          ],
    );

    // 7. Test clear search item
    blocTest<SearchBooksBloc, SearchBooksState>(
      'removes item from search history when cleared',
      seed:
          () => SearchBooksSuccess(
            searchResult: mockSearchResult,
            searchHistory: ['flutter', 'dart', 'react'],
          ),
      build: () => searchBooksBloc,
      act: (bloc) => bloc.clearSearch(1), // Clear 'dart'
      expect:
          () => [
            isA<SearchBooksSuccess>().having(
              (state) => state.searchHistory,
              'search history',
              ['flutter', 'react'],
            ),
          ],
    );

    // 8. Test debounce feature
    test('uses debouncer when searching', () {
      // Reset the default behavior
      reset(mockDebouncer);
      when(() => mockDebouncer.run(any())).thenReturn(null);

      // Act
      searchBooksBloc.searchBooks('flutter');

      // Assert
      verify(() => mockDebouncer.run(any())).called(1);
    });
    test('toJson correctly serializes the state', () {
      // Arrange
      final state = SearchBooksSuccess(
        searchResult: mockSearchResult,
        searchHistory: ['flutter', 'dart'],
      );

      // Act
      final json = searchBooksBloc.toJson(state);

      // Assert
      expect(json, {
        'searchHistory': ['flutter', 'dart'],
      });
    });

    // 10. Test hydration - fromJson
    test('fromJson correctly deserializes the state', () {
      // Arrange
      final json = {
        'searchHistory': ['flutter', 'dart'],
      };

      // Act
      final state = searchBooksBloc.fromJson(json);

      // Assert
      expect(state, isA<SearchBooksSuccess>());
      expect(state?.searchHistory, ['flutter', 'dart']);
      expect((state as SearchBooksSuccess).searchResult.books, isEmpty);
    });
  });
}
