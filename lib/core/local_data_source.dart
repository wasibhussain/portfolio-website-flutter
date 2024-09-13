import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static Future<bool> setThemeData(bool isDarkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('theme_value', isDarkTheme);
  }

  static Future<bool> getThemeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme_value') ?? false;
  }
}
