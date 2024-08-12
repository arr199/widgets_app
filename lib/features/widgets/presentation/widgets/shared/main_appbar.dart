import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar = AppBar();

  MainAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(color: color, fontSize: 20),
    );
  }
}
