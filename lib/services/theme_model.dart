import 'package:afrocomix/services/theme_prefs.dart';
import 'package:flutter/cupertino.dart';

class ThemeModal extends ChangeNotifier {
  late bool _isDark;
  late ThemePrefs themeSharedPreferences;
  bool get isDark => _isDark;
  ThemeModal() {
    _isDark = false;
    themeSharedPreferences = ThemePrefs();
    getThemePrefs();
  }

  set isDark(bool value) {
    _isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePrefs() async {
    _isDark = await themeSharedPreferences.getTheme();
    notifyListeners();
  }
}
