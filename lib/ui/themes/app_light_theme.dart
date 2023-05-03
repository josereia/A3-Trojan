import 'package:calculator/ui/themes/app_theme_extensions.dart';
import 'package:flutter/material.dart';

abstract class AppLightTheme {
  static final ThemeColors colors = ThemeColors(
    primary: const Color(0xFF4D3FC6).withOpacity(0.2),
    onPrimary: const Color(0xFF000000),
    secondary: const Color(0xFFFFFFFF).withOpacity(0.2),
    onSecondary: const Color(0xFF000000),
    border: const Color(0xFF000000).withOpacity(0.1),
    shadow: const Color(0xFF000000).withOpacity(0.1),
    text: const Color(0xFF000000),
    textContrast: const Color(0xFFFFFFFF),
    background: const Color(0xFFFFFFFF).withOpacity(0.6),
    onBackground: const Color(0xFF000000),
  );

  static ThemeData baseTheme = ThemeData(brightness: Brightness.light);
}
