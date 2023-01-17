import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  void changeTheme(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }
}
