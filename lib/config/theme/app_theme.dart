import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff8f0000),
          primary: Color(0xff8f0000),
          secondary: Color(0xAFE28400)));
}
