import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff8f0000),
            primary: Color.fromRGBO(143, 0, 0, 1),
            secondary: const Color.fromRGBO(226, 133, 0, 1)),
      );
}
