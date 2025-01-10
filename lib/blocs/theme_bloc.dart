import 'package:counter__with_bloc/blocs/theme_event.dart';
import 'package:counter__with_bloc/blocs/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ThemeBloc by using the event and the state to implement toggle mode
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.themeData.brightness == Brightness.light) {
        emit(ThemeState(darkTheme));
      } else {
        emit(ThemeState(lightTheme));
      }
    });
  }

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}
