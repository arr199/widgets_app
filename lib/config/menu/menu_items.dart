import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const List<MenuItems> appMenuItems = [
  MenuItems(
    title: "Buttons",
    subtitle: "Multiple Flutter buttons",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: "Cards",
    subtitle: "A styled container",
    link: "/cards",
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: "Progress Indicators",
    subtitle: "Generals and Controlled",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: "Snackbars",
    subtitle: "Screen Indicators",
    link: "/snackbar",
    icon: Icons.info_outlined,
  )
];
