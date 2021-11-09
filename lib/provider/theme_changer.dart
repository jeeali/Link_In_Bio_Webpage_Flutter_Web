import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ThemeChanger with ChangeNotifier {
  bool isLight;

  ThemeChanger(bool isLight) {
    if (isLight != null)
      setTheme(isLight);
    else
      setTheme(false);
  }

  setTheme(bool isLight) async {
    this.isLight = isLight;
    notifyListeners();
  }
}
