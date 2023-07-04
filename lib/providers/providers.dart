import 'package:dart_theme_riverpod/theme_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  return throw UnimplementedError();
});

final themeProvider = Provider<bool>((ref) {
  return ref.watch(themeStateProvider);
});
