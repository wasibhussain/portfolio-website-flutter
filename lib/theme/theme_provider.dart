import 'package:flutter/material.dart';
import 'package:portfolio_site/core/local_data_source.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    notifyListeners();
  }

  // Change the theme and persist it using SharedPreferences
  void changeTheme() async {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
    await LocalDataSource.setThemeData(_isDarkTheme);
  }
}
