import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/features/widgets/presentation/providers/counter/theme_provider.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar = AppBar();

  MainAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context, ref) {
    final color = Theme.of(context).colorScheme.primary;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(color: color, fontSize: 20),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(themeNotifierProvider.notifier).toggleDarkMode();
          },
          icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
        )
      ],
    );
  }
}
