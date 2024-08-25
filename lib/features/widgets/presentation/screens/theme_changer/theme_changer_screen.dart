import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/features/widgets/presentation/providers/counter/theme_provider.dart';
import 'package:widgets_app/features/widgets/presentation/widgets/shared/main_appbar.dart';

class ThemeChangerScreen extends StatelessWidget {
  static const name = "theme_changer";

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ThemeChangerView();
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final colorsList = ref.watch(colorListProvider);
    final currentTheme = ref.watch(themeNotifierProvider).selectedColor;

    return Scaffold(
      appBar: MainAppBar(title: "Theme Changer"),
      body: ListView.builder(
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return RadioListTile(
            title: Text("Color", style: TextStyle(color: colorsList[index])),
            subtitle: Text(
              colorList[index].value.toString(),
              style: TextStyle(color: colorsList[index]),
            ),
            activeColor: colorsList[index],
            value: index,
            groupValue: currentTheme,
            onChanged: (value) {
              ref.read(themeNotifierProvider.notifier).changeThemeColor(index);
            },
          );
        },
      ),
    );
  }
}
