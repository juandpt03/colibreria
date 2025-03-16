import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';

class LanguageBloc extends Bloc<LanguageEvent, Locale> {
  LanguageBloc() : super(PlatformDispatcher.instance.locale) {
    on<UpdateLanguageEvent>(_onUpdateLanguageEvent);
  }

  void updateLanguage(Locale locale) {
    if (locale == state) return;
    add(UpdateLanguageEvent(locale));
  }

  _onUpdateLanguageEvent(UpdateLanguageEvent event, Emitter<Locale> emit) {
    emit(event.locale);
  }
}
