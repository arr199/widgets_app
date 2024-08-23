import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/main_app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/features/widgets/presentation/providers/counter/darkmode_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedTheme = ref.watch(selectedThemeProvider);
    final isDarkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      routerConfig: mainAppRouter,
      theme: AppTheme(selectedColor: selectedTheme, isDarkMode: isDarkMode)
          .getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
