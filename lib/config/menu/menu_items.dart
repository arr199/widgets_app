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
  ),
  MenuItems(
    title: "Animated Container",
    subtitle: "Animated Containers",
    link: "/animated_container",
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItems(
    title: "Ui Controls",
    subtitle: "A list of ui controls",
    link: "/ui_controls",
    icon: Icons.card_giftcard,
  ),
  MenuItems(
    title: "App tutorial",
    subtitle: "How to use the app",
    link: "/app_tutorial",
    icon: Icons.school,
  )
];
