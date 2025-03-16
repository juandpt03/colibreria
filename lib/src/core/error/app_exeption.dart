import 'package:colibreria/src/core/config/intl/l10n.dart';

class AppException implements Exception {
  final String message;
  final bool error;
  final Exception exception;

  AppException({
    required this.message,
    required this.error,
    required this.exception,
  });

  factory AppException.fromException(dynamic exception) {
    if (exception is AppException) return exception;

    return AppException(
      message: exception.toString(),
      error: true,
      exception: exception,
    );
  }

  factory AppException.fromMessage(String? message) => AppException(
    message: message ?? AppLocalizations.current.anUnknownErrorOccurred,
    error: true,
    exception: Exception(message),
  );

  factory AppException.defaultError() => AppException(
    message: AppLocalizations.current.anUnknownErrorOccurred,
    error: true,
    exception: Exception(AppLocalizations.current.anUnknownErrorOccurred),
  );

  factory AppException.nullValue() => AppException(
    message: AppLocalizations.current.unexpectedNullValue,
    error: true,
    exception: Exception(AppLocalizations.current.unexpectedNullValue),
  );
}
