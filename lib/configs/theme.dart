import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';
import './size.dart';

class Themings {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColors.lightGray,
      primary: AppColors.brown,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: Size.xl,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: Size.lg,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: Size.md,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: Size.md,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      )
    )
    // textTheme:
  );
}