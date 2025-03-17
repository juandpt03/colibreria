part of 'search_books_bloc.dart';

sealed class SearchBooksState extends Equatable {
  final List<String> searchHistory;

  const SearchBooksState({required this.searchHistory});

  @override
  List<Object> get props => [searchHistory];

  /// Maps the current state to a specific type using the functional programming style
  T map<T>({
    required T Function(SearchBooksLoading) loading,
    required T Function(SearchBooksSuccess) success,
    required T Function(SearchBooksError) error,
  }) {
    return switch (this) {
      SearchBooksLoading s => loading(s),
      SearchBooksSuccess s => success(s),
      SearchBooksError s => error(s),
    };
  }

  void when({
    void Function(SearchBooksLoading)? loading,
    void Function(SearchBooksSuccess)? success,
    void Function(SearchBooksError)? error,
  }) {
    switch (this) {
      case SearchBooksLoading s:
        loading?.call(s);
        break;
      case SearchBooksSuccess s:
        success?.call(s);
        break;
      case SearchBooksError s:
        error?.call(s);
        break;
    }
  }
}

final class SearchBooksLoading extends SearchBooksState {
  const SearchBooksLoading({super.searchHistory = const []});
}

final class SearchBooksSuccess extends SearchBooksState {
  final BookSearchResult searchResult;

  final bool isLoading;

  const SearchBooksSuccess({
    required this.searchResult,
    super.searchHistory = const [],
    this.isLoading = false,
  });

  /// Creates a copy of the current state with updated values
  SearchBooksSuccess copyWith({
    BookSearchResult? searchResult,
    List<String>? searchHistory,
    bool? isLoading,
  }) {
    return SearchBooksSuccess(
      searchResult: searchResult ?? this.searchResult,
      searchHistory: searchHistory ?? this.searchHistory,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [searchResult, searchHistory, isLoading];
}

final class SearchBooksError extends SearchBooksState {
  final AppException error;

  const SearchBooksError({required this.error, super.searchHistory = const []});

  @override
  List<Object> get props => [error, searchHistory];
}
