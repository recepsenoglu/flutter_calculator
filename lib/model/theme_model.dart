import 'package:flutter/material.dart';
import 'package:flutter_calculator/utils/theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _preferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  getPreferences() async {
    _isDark = await _preferences.getThemePreference();
    notifyListeners();
  }

  void changeTheme(bool isDark) {
    _isDark = isDark;
    _preferences.setThemePreference(isDark);
    notifyListeners();
  }
}
