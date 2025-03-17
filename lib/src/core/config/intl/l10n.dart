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
