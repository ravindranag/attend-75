import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context, Brightness brightness) {
    bool isDarkTheme = brightness == Brightness.dark ? true : false;

    ThemeData baseTheme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.yellow,
      brightness: brightness,
      fontFamily: 'Poppins',
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: isDarkTheme ? Colors.white60 : Colors.black45,
        displayColor: isDarkTheme ? Colors.white : Colors.black87,
        fontFamily: 'Poppins'
      )
    );

    return baseTheme;
  }
}
