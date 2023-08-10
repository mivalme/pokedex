import 'package:flutter/material.dart';

class AppTheme {
  final colorSeed = Colors.cyan;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
  });

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorSeed,
      brightness: isDarkMode ? Brightness.dark : Brightness.light);
}
