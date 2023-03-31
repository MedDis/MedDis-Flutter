import 'package:flutter/material.dart' show Color, Colors, MaterialColor;

const primary = Color(0xFF008080);
const primaryLight = Color(0xFF93C6C6);
const yellow = Color(0xFFFBEB23);
const grey = Color(0xFF5B5B5C);
const greenSuccess = Color(0xFF00CD15);
const redDanger = Color(0xFFFF151C);
const deepBlue = Color.fromRGBO(20, 38, 80, 1);
const green = Colors.green;
const red = Colors.red;

class MyColors {
  static const MaterialColor primarymaterial =
      MaterialColor(_primarymaterialPrimaryValue, <int, Color>{
    50: Color(0xFFE0F0F0),
    100: Color(0xFFB3D9D9),
    200: Color(0xFF80C0C0),
    300: Color(0xFF4DA6A6),
    400: Color(0xFF269393),
    500: Color(_primarymaterialPrimaryValue),
    600: Color(0xFF007878),
    700: Color(0xFF006D6D),
    800: Color(0xFF006363),
    900: Color(0xFF005050),
  });
  static const int _primarymaterialPrimaryValue = 0xFF008080;

  static const MaterialColor primarymaterialAccent =
      MaterialColor(_primarymaterialAccentValue, <int, Color>{
    100: Color(0xFF83FFFF),
    200: Color(_primarymaterialAccentValue),
    400: Color(0xFF1DFFFF),
    700: Color(0xFF03FFFF),
  });
  static const int _primarymaterialAccentValue = 0xFF50FFFF;
}
