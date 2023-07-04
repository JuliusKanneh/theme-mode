import 'package:dart_theme_riverpod/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeStateProvider = StateNotifierProvider<ThemeState, bool>((ref) {
  return ThemeState(
      ref.watch(sharedPreferencesProvider).getBool('isDarkMode') ?? false);
});

class ThemeState extends StateNotifier<bool> {
  ThemeState(bool isDarkMode) : super(isDarkMode);

  void toggleTheme() {
    state = !state;
  }
}
