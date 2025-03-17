class ApiEndpoints {
  // Search books
  static String searchBooks(String query, {int page = 1}) =>
      '/search/${query.replaceAll(' ', '')}/$page';

  // New releases
  static const String newReleases = '/new';

  // Book details
  static String bookDetails(String isbn13) => '/books/$isbn13';
}
