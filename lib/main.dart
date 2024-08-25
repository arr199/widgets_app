import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/main_app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/features/widgets/presentation/providers/counter/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: mainAppRouter,
      theme: appTheme.getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
