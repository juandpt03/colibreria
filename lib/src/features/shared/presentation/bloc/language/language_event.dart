part of 'language_bloc.dart';

sealed class LanguageEvent {
  const LanguageEvent();
}

class UpdateLanguageEvent extends LanguageEvent {
  final Locale locale;

  const UpdateLanguageEvent(this.locale);
}
