import 'package:capstone_project/helper/preference_helper.dart';
import 'package:capstone_project/style/theme_style.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  DarkThemeProvider({required this.preferencesHelper}) {
    _getTheme();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDark;
    notifyListeners();
  }

  set enableDarkTheme(bool value) {
    preferencesHelper.setDark(value);
    _isDarkTheme = value;
    notifyListeners();
  }
}
