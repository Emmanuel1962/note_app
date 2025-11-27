import 'package:flutter/material.dart';
import 'package:note_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
// intially,theme is light mode
  ThemeData _themeData = lightMode;
//access the current theme from other parts of the code
  ThemeData get themeData => _themeData;
// to know if it's in darkmode or not
  bool get isDarkMode => _themeData == darkMode;
// setter method is used to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

// we will use the toggle to switch later on
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
