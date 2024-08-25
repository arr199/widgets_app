import 'dart:ui';

import 'package:flutter/material.dart';

final List<Color> colorList = [
  Colors.blue,
  Colors.black,
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({required this.selectedColor, required this.isDarkMode})
      : assert(
          selectedColor < colorList.length,
          "selectedColor must be a less than ${colorList.length}",
        ),
        assert(selectedColor >= 0, "selectedColor cant be less than 0");

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true));
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
