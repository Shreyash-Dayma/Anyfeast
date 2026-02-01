import 'package:flutter/material.dart';

class AppColors {
  static const Color red = Color(0xFFB92424);
  static const Color redLight = Color(0xFFD94B4B);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFE9E9E9);
  static const Color gray600 = Color(0xFF6B6B6B);
  static const Color textPrimary = Color(0xFF111111);
  static const Color darkGray = Color(0xFF4A4A4A);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.red,
      primary: AppColors.red,
      secondary: AppColors.redLight,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.gray100,
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.textPrimary),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.gray600),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        minimumSize: Size(160, 56),
      ),
    ),
  );
}
