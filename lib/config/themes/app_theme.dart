import 'dart:ui';

import 'package:flutter/material.dart';

final List<Color> colorList = [
  Colors.black,
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
  Colors.white,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  })  : assert(
          selectedColor < colorList.length,
          "selectedColor must be a less than colorList length",
        ),
        assert(selectedColor >= 0, "selectedColor cant be less than 0");

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true));
  }
}
