import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  //Night mode
  static const Color lightBackground = Color(0xFFF7F5F1);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightInputFill = Color(0xFFF5F3FB);
  static const Color lightPrimary = Color(0xFF534AB7);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF201C3A);
  static const Color lightTextSecondary = Color(0xFF6B6880);
  static const Color lightBorder = Color(0xFFE4E1F0);

  //Dark mode
  static const Color darkBackground = Color(0xFF14121F);
  static const Color darkSurface = Color(0xFF1E1B2E);
  static const Color darkInputFill = Color(0xFF262238);
  static const Color darkPrimary = Color(0xFFA79EF2);
  static const Color darkOnPrimary = Color(0xFF1A1730);
  static const Color darkTextPrimary = Color(0xFFEDEBF7);
  static const Color darkTextSecondary = Color(0xFFA9A6C4);
  static const Color darkBorder = Color(0xFF322D4A);
}

class ThemeUtils {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        onPrimary: AppColors.lightOnPrimary,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightTextPrimary,
        outline: AppColors.lightBorder,
      ),

      //Cấu hình ô nhập liệu
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightInputFill,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightBorder),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      //Cấu hình Text
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
        bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: AppColors.darkOnPrimary,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkTextPrimary,
        outline: AppColors.darkBorder,
      ),

      //Cấu hình ô nhập liệu (inputFill)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputFill,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkBorder),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      //Cấu hình Text
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
        bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
      ),
    );
  }
}
