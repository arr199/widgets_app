import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

final StateProvider<bool> darkModeProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colorList);
final selectedThemeProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeController, AppTheme>(
    (ref) => ThemeController());

class ThemeController extends StateNotifier<AppTheme> {
  ThemeController() : super(AppTheme(isDarkMode: false, selectedColor: 1));

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeThemeColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
