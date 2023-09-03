import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff8f0000),
            primary: const Color(0xff8f0000),
            secondary: const Color.fromARGB(204, 175, 102, 1)),
      );
}
