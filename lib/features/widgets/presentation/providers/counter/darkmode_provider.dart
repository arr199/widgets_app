import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final StateProvider<bool> darkModeProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colorList);
final selectedThemeProvider = StateProvider((ref) => 0);