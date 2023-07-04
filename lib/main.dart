import 'package:dart_theme_riverpod/providers/providers.dart';
import 'package:dart_theme_riverpod/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.read(themeProvider) ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Example'),
        ),
        body: Center(
          child: Consumer(
            builder: (context, watch, _) {
              final isDarkMode = ref.watch(themeProvider);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current theme: ${isDarkMode ? 'Dark' : 'Light'}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(themeStateProvider.notifier).toggleTheme();
                      ref
                          .read(sharedPreferencesProvider)
                          .setBool('isDarkMode', !isDarkMode);
                    },
                    child: const Text('Toggle Theme'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
