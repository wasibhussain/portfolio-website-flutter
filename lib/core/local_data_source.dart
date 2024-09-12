import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  setThemeData(bool isDarkTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('theme_value', isDarkTheme);
  }

  getThemeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme_value') ?? false;
  }
}
