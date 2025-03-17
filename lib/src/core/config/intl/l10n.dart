// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `An unknown error occurred`
  String get anUnknownErrorOccurred {
    return Intl.message(
      'An unknown error occurred',
      name: 'anUnknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected null value`
  String get unexpectedNullValue {
    return Intl.message(
      'Unexpected null value',
      name: 'unexpectedNullValue',
      desc: '',
      args: [],
    );
  }

  /// `No title available`
  String get noTitleAvailable {
    return Intl.message(
      'No title available',
      name: 'noTitleAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No description available`
  String get noDescriptionAvailable {
    return Intl.message(
      'No description available',
      name: 'noDescriptionAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Price not available`
  String get priceNotAvailable {
    return Intl.message(
      'Price not available',
      name: 'priceNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `ISBN not available`
  String get isbnNotAvailable {
    return Intl.message(
      'ISBN not available',
      name: 'isbnNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No books found for`
  String get noBooksFoundFor {
    return Intl.message(
      'No books found for',
      name: 'noBooksFoundFor',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Recent Search`
  String get recentSearch {
    return Intl.message(
      'Recent Search',
      name: 'recentSearch',
      desc: '',
      args: [],
    );
  }

  /// `Found`
  String get found {
    return Intl.message('Found', name: 'found', desc: '', args: []);
  }

  /// `results for`
  String get resultsFor {
    return Intl.message('results for', name: 'resultsFor', desc: '', args: []);
  }

  /// `No recent searches`
  String get noRecentSearches {
    return Intl.message(
      'No recent searches',
      name: 'noRecentSearches',
      desc: '',
      args: [],
    );
  }

  /// `No books found`
  String get noBooksFound {
    return Intl.message(
      'No books found',
      name: 'noBooksFound',
      desc: '',
      args: [],
    );
  }

  /// `New Books`
  String get newBooks {
    return Intl.message('New Books', name: 'newBooks', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Travel`
  String get travel {
    return Intl.message('Travel', name: 'travel', desc: '', args: []);
  }

  /// `Biography`
  String get biography {
    return Intl.message('Biography', name: 'biography', desc: '', args: []);
  }

  /// `Horror`
  String get horror {
    return Intl.message('Horror', name: 'horror', desc: '', args: []);
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message('Buy Now', name: 'buyNow', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `No reviews yet`
  String get noReviewsYet {
    return Intl.message(
      'No reviews yet',
      name: 'noReviewsYet',
      desc: '',
      args: [],
    );
  }

  /// `About Book`
  String get aboutBook {
    return Intl.message('About Book', name: 'aboutBook', desc: '', args: []);
  }

  /// `Chapters`
  String get chapters {
    return Intl.message('Chapters', name: 'chapters', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Publisher`
  String get publisher {
    return Intl.message('Publisher', name: 'publisher', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Pages`
  String get pages {
    return Intl.message('Pages', name: 'pages', desc: '', args: []);
  }

  /// `ISBN-13`
  String get isbn13 {
    return Intl.message('ISBN-13', name: 'isbn13', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Chapter`
  String get chapter {
    return Intl.message('Chapter', name: 'chapter', desc: '', args: []);
  }

  /// `No chapters available for this book`
  String get noChaptersAvailableForThisBook {
    return Intl.message(
      'No chapters available for this book',
      name: 'noChaptersAvailableForThisBook',
      desc: '',
      args: [],
    );
  }

  /// `Book Details`
  String get bookDetails {
    return Intl.message(
      'Book Details',
      name: 'bookDetails',
      desc: '',
      args: [],
    );
  }

  /// `Error opening the URL:`
  String get errorOpeningTheUrl {
    return Intl.message(
      'Error opening the URL:',
      name: 'errorOpeningTheUrl',
      desc: '',
      args: [],
    );
  }

  /// `Could not open the URL:`
  String get couldNotOpenTheUrl {
    return Intl.message(
      'Could not open the URL:',
      name: 'couldNotOpenTheUrl',
      desc: '',
      args: [],
    );
  }

  /// `Check it out`
  String get checkItOut {
    return Intl.message('Check it out', name: 'checkItOut', desc: '', args: []);
  }

  /// `Check out this book:`
  String get checkOutThisBook {
    return Intl.message(
      'Check out this book:',
      name: 'checkOutThisBook',
      desc: '',
      args: [],
    );
  }

  /// `Error trying to share the book:`
  String get errorTryingToShareTheBook {
    return Intl.message(
      'Error trying to share the book:',
      name: 'errorTryingToShareTheBook',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
