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
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: AppColors.black,
        fontSize: AppSizes.md,
        fontWeight: FontWeight.w700,
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
      )
    ),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
        labelStyle: const TextStyle(
            fontSize: AppSizes.lg,
            fontWeight: FontWeight.w600
        ),
        hintStyle: const TextStyle(
          color: AppColors.placeholderGray,
          fontSize: AppSizes.md,
          fontWeight: FontWeight.normal,
        )
    )
    // textTheme:
  );
}