import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefs {
  // ignore: constant_identifier_names
  static const PREF_KEY = 'THEME_KEY';
  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY) ?? false;
  }
}
