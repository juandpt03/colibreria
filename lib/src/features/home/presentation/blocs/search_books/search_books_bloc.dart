import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:colibreria/src/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:colibreria/src/features/home/domain/domain.dart';

part 'search_books_event.dart';
part 'search_books_state.dart';

class SearchBooksBloc extends HydratedBloc<SearchBooksEvent, SearchBooksState> {
  final BooksUseCases _booksUseCases;
  final Debouncer _debouncer;

  SearchBooksBloc({
    required BooksUseCases booksUseCases,
    required Debouncer debouncer,
  }) : _booksUseCases = booksUseCases,
       _debouncer = debouncer,
       super(SearchBooksLoading()) {
    _eventHandlers();
  }
  //Handlers for events

  void _eventHandlers() {
    on<SearchBooks>(_onSearchBooks);
    on<LoadMoreSearchResults>(_onLoadMoreSearchResults);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchBooks(
    SearchBooks event,
    Emitter<SearchBooksState> emit,
  ) async {
    final currentHistory = state.searchHistory;

    emit(SearchBooksLoading(searchHistory: currentHistory));

    final result = await _booksUseCases.searchBooks(event.query);

    result.when(
      left:
          (error) => emit(
            SearchBooksError(
              error: error,
              searchHistory: _updateSearchHistory(event.query),
            ),
          ),
      right:
          (searchResult) => emit(
            SearchBooksSuccess(
              searchResult: searchResult,
              searchHistory: _updateSearchHistory(event.query),
            ),
          ),
    );
  }

  Future<void> _onLoadMoreSearchResults(
    LoadMoreSearchResults event,
    Emitter<SearchBooksState> emit,
  ) async {
    if (state is SearchBooksSuccess) {
      final currentState = state as SearchBooksSuccess;
      emit(currentState.copyWith(isLoading: true));

      final result = await _booksUseCases.searchBooks(
        event.query,
        page: event.nextPage,
      );

      result.when(
        left: (error) {
          emit(
            SearchBooksError(
              error: error,
              searchHistory: currentState.searchHistory,
            ),
          );
        },
        right: (newSearchResult) {
          emit(
            currentState.copyWith(
              searchResult: currentState.searchResult.copyWith(
                total: newSearchResult.total,
                page: newSearchResult.page,
                books: [
                  ...currentState.searchResult.books,
                  ...newSearchResult.books,
                ],
              ),
              isLoading: false,
            ),
          );
        },
      );
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchBooksState> emit) {
    _debouncer.cancel();
    state.map(
      loading: (_) => null,
      success: (state) {
        final List<String> updatedHistory = List<String>.from(
          state.searchHistory,
        );

        updatedHistory.removeAt(event.index);

        emit(
          SearchBooksSuccess(
            searchResult: BookSearchResult(total: 0, page: 1, books: []),
            searchHistory: updatedHistory,
          ),
        );
      },
      error: (state) {
        final List<String> updatedHistory = List<String>.from(
          state.searchHistory,
        );
        updatedHistory.removeAt(event.index);

        emit(
          SearchBooksSuccess(
            searchResult: BookSearchResult(total: 0, page: 1, books: []),
            searchHistory: updatedHistory,
          ),
        );
      },
    );
  }

  List<String> _updateSearchHistory(String query) {
    final List<String> currentHistory = state.searchHistory;
    if (query.trim().isEmpty) return currentHistory;

    currentHistory.remove(query);
    currentHistory.insert(0, query);

    if (currentHistory.length > 5) {
      return currentHistory.sublist(0, 5);
    }

    return currentHistory;
  }

  // events dispatchers

  void searchBooks(String query) {
    _debouncer.run(() => add(SearchBooks(query: query)));
  }

  void loadMoreResults(String query, int nextPage) =>
      add(LoadMoreSearchResults(query: query, nextPage: nextPage));

  void clearSearch(int index) => add(ClearSearch(index: index));

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }

  // caching using hydrated_bloc

  @override
  SearchBooksState? fromJson(Map<String, dynamic> json) {
    try {
      final searchHistory = List<String>.from(json['searchHistory'] ?? []);

      return SearchBooksSuccess(
        searchResult: BookSearchResult(total: 0, page: 1, books: []),
        searchHistory: searchHistory,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SearchBooksState state) {
    return state.map(
      loading: (_) => null,
      success: (state) => {'searchHistory': state.searchHistory},
      error: (state) => {'searchHistory': state.searchHistory},
    );
  }
}
