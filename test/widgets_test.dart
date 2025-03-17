import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:colibreria/src/features/home/presentation/screens/search/widgets/book_card.dart';
import 'package:colibreria/src/features/home/presentation/screens/book_details/widgets/book_header.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/buttons/custom_elevated_button.dart';
import 'package:colibreria/src/core/config/intl/l10n.dart';
import 'package:colibreria/src/features/home/domain/entities/book.dart';
import 'package:colibreria/src/features/home/domain/entities/book_detail.dart';
import 'package:colibreria/src/features/home/presentation/blocs/search_books/search_books_bloc.dart';
import 'package:colibreria/src/features/shared/presentation/widgets/loadings/custom_loading.dart';

// Mocks
class MockSearchBooksBloc extends MockBloc<SearchBooksEvent, SearchBooksState>
    implements SearchBooksBloc {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  // Setup localization mock
  late AppLocalizations mockLocalizations;

  setUp(() {
    mockLocalizations = MockAppLocalizations();
    when(() => mockLocalizations.noTitleAvailable).thenReturn('No title');
    when(
      () => mockLocalizations.noDescriptionAvailable,
    ).thenReturn('No description');
    when(
      () => mockLocalizations.priceNotAvailable,
    ).thenReturn('Price not available');
    when(
      () => mockLocalizations.isbnNotAvailable,
    ).thenReturn('ISBN not available');
  });

  group('BookCard Widget Tests', () {
    late Book book;

    setUp(() {
      book = const Book(
        title: 'Flutter in Action',
        subtitle: 'A hands-on guide to Flutter',
        isbn13: '9781617296147',
        price: '39.99',
        image: 'https://example.com/image.jpg',
        url: 'https://example.com/book',
      );
    });

    testWidgets('renders book details correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: BookCard(book: book))),
      );

      // Verify the displayed book information
      expect(find.text('Flutter in Action'), findsOneWidget);
      expect(find.text('A hands-on guide to Flutter'), findsOneWidget);
      expect(find.text('39.99'), findsOneWidget);
      expect(find.text('ISBN-13 9781617296147'), findsOneWidget);

      // Verify image is loading from network
      final imageFinder = find.byType(CachedNetworkImage);
      expect(imageFinder, findsOneWidget);
    });
  });

  group('BookHeader Widget Tests', () {
    late BookDetail bookDetail;

    setUp(() {
      bookDetail = BookDetail(
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
        price: '39.99',
        image: 'https://example.com/image.jpg',
        url: 'https://example.com/book',
        pdfs: [],
      );
    });

    testWidgets('displays book information correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: BookHeader(book: bookDetail))),
      );

      expect(find.text('Flutter in Action'), findsOneWidget);
      expect(find.text('Eric Windmill'), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);

      // Verify the book cover is displayed
      final imageFinder = find.byType(CachedNetworkImage);
      expect(imageFinder, findsOneWidget);
    });
  });

  // Testing an important shared widget
  group('CustomElevatedButton Widget Tests', () {
    testWidgets('renders correctly and handles tap', (tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomElevatedButton(
              text: 'Press Me',
              onPressed: () => wasTapped = true,
            ),
          ),
        ),
      );

      // Verify button displays correct text
      expect(find.text('Press Me'), findsOneWidget);

      // Press the button and verify callback was triggered
      await tester.tap(find.text('Press Me'));
      expect(wasTapped, true);
    });

    testWidgets('respects disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomElevatedButton(
              text: 'Disabled Button',
              onPressed: null, // null should disable the button
            ),
          ),
        ),
      );

      // Find the underlying ElevatedButton
      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );

      // When onPressed is null, the button should be disabled
      expect(elevatedButton.onPressed, isNull);
    });
  });

  // Testing CustomLoading which is used throughout the app
  group('CustomLoading Widget Test', () {
    testWidgets('renders loading indicator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: CustomLoading())),
      );

      // Verify that the CircularProgressIndicator is displayed
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
