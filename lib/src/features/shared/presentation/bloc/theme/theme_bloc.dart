import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.system)) {
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) {
    final newThemeMode =
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(ThemeState(themeMode: newThemeMode));
  }

  void toggleTheme() => add(ToggleTheme());
  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState(themeMode: ThemeMode.values[json['theme_mode'] ?? 0]);
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return {'theme_mode': state.themeMode.index};
  }
}
