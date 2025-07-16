import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.light));

  void toggleTheme() {
    emit(ThemeState(
      themeMode: state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    ));
  }
}
