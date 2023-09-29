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

class TabModal extends ChangeNotifier {
  late bool _isPrev;
  late TabPrefs tabSharedPreferences;
  bool get isPrev => _isPrev;
  TabModal() {
    _isPrev = false;
    tabSharedPreferences = TabPrefs();
    getTabPrefs();
  }

  set isPrev(bool value) {
    _isPrev = value;
    tabSharedPreferences.setTab(value);
    notifyListeners();
  }

  getTabPrefs() async {
    _isPrev = await tabSharedPreferences.getTab();
    notifyListeners();
  }
}
