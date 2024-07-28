import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = appMenuItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomListItem(items: items, index: index);
        },
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final List<MenuItems> items;
  final int index;

  const CustomListItem({
    super.key,
    required this.items,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 16),
      hoverColor: colors.primary.withOpacity(0.1),
      textColor: colors.primary,
      title: Text(items[index].title),
      subtitle: Text(items[index].subtitle),
      leading: Icon(
        items[index].icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        color: colors.primary,
      ),
      onTap: () {
        // Navigate to other screen
        context.push(items[index].link);
      },
      splashColor: colors.primary.withOpacity(0.2),
    );
  }
}
