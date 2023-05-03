import 'package:calculator/ui/themes/app_theme_extensions.dart';
import 'package:flutter/material.dart';

abstract class AppDarkTheme {
  static final ThemeColors colors = ThemeColors(
    primary: const Color(0xFF948DD6).withOpacity(0.2),
    onPrimary: const Color(0xFFFFFFFF),
    secondary: const Color(0xFFFFFFFF).withOpacity(0.1),
    onSecondary: const Color(0xFFFFFFFF),
    border: const Color(0xFFFFFFFF).withOpacity(0.1),
    shadow: const Color(0xFFFFFFFF).withOpacity(0.1),
    text: const Color(0xFFFFFFFF),
    textContrast: const Color(0xFF000000),
    background: const Color(0xFF000000).withOpacity(0.6),
    onBackground: const Color(0xFFFFFFFF),
  );

  static ThemeData baseTheme = ThemeData(brightness: Brightness.dark);
}
