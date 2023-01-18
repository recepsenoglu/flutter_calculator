import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String _themeKey = "theme_key";

  Future<void> setThemePreference(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_themeKey, isDark);
  }

  Future<bool> getThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_themeKey) ?? false;
  }
}
