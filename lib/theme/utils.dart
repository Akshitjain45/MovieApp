import 'package:flutter/material.dart';


final ThemeData myTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: Color(0xff242248),
    accentColor: Color(0xff3052cf),
    canvasColor: Colors.transparent,
    primaryIconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline5: TextStyle(
          fontFamily: ('Roboto'),
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24),
      bodyText2: TextStyle(
          fontFamily: ('Roboto'),
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18),
      bodyText1: TextStyle(
          fontFamily: ('Roboto'),
          color: Colors.white,
          fontSize: 18),
      caption: TextStyle(
          fontFamily: ('Roboto'),
          fontWeight: FontWeight.normal,
          color: Colors.white,
          fontSize: 14),
    ),
  );
}

class ThemeState extends ChangeNotifier {
  ThemeData _themeData = myTheme;

  get themeData => _themeData;
  set themeData(ThemeData val) {
    _themeData = myTheme;
  }

}

