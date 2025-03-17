part of 'search_books_bloc.dart';

sealed class SearchBooksEvent {
  const SearchBooksEvent();
}

final class SearchBooks extends SearchBooksEvent {
  final String query;

  const SearchBooks({required this.query});
}

final class LoadMoreSearchResults extends SearchBooksEvent {
  final String query;
  final int nextPage;

  const LoadMoreSearchResults({required this.query, required this.nextPage});
}

final class ClearSearch extends SearchBooksEvent {
  final int index;
  const ClearSearch({required this.index});
}
