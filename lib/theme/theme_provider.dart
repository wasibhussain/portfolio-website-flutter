import 'package:flutter/material.dart';
import 'package:portfolio_site/core/local_data_source.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    LocalDataSource().setThemeData(isDarkTheme);
    notifyListeners();
  }
}
