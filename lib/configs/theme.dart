import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';
import './size.dart';

class Theming {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColors.lightGray,
      primary: AppColors.brown,
    ),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.xl,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.lg,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.md,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.lg,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.md,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        labelSmall: TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.md,
        )),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      labelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: AppSizes.xl,
          fontWeight: FontWeight.w500),
      hintStyle: const TextStyle(
        color: AppColors.placeholderGray,
        fontSize: AppSizes.md,
        fontWeight: FontWeight.normal,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0
      )
    ), // textTheme:
    cardTheme: CardTheme(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
    ),
  );
}
