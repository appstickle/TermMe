import 'package:flutter/material.dart';

class TerminalColors {
  static const Color green = Color(0xFF39FF14);
  static const Color dimGreen = Color(0xFF1A8A05);
  static const Color black = Colors.black;
}

ThemeData terminalTheme() {
  const textColor = TerminalColors.green;

  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: TerminalColors.black,
    colorScheme: const ColorScheme.dark(
      primary: TerminalColors.green,
      secondary: TerminalColors.dimGreen,
      surface: TerminalColors.black,
    ),
    textTheme: base.textTheme.apply(
      bodyColor: textColor,
      displayColor: textColor,
      fontFamily: 'monospace',
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: textColor,
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TerminalColors.dimGreen),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: TerminalColors.green),
      ),
      labelStyle: TextStyle(color: TerminalColors.dimGreen),
    ),
  );
}
