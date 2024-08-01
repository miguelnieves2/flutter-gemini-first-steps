import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_first_steps/config/theme/app_theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  // Tener el estado de isDarkMode accesible en el proyecto
  bool get isDarkMode => state.isDarkMode;

  void toggleTheme() {
    state = AppTheme(
      selectedColor: state.selectedColor,
      isDarkMode: !state.isDarkMode,
    );
  }

  void setColor(int colorIndex) {
    state = AppTheme(
      selectedColor: colorIndex,
      isDarkMode: state.isDarkMode,
    );
  }
}
