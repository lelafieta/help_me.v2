import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF4CAF50);
  static const Color accentColor = Color(0xFFFFC107);

  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightTextColor = Color(0xFF000000);
  static const Color lightAppBarColor = Color(0xFF4CAF50);

  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color darkTextColor = Color(0xFFFFFFFF);
  static const Color darkAppBarColor = Color(0xFF212121);
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  hintColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightAppBarColor,
    foregroundColor: AppColors.lightTextColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightTextColor, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(color: AppColors.lightTextColor, fontFamily: 'Poppins'),
    titleLarge: TextStyle(color: AppColors.lightTextColor, fontFamily: 'Poppins'),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  hintColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkAppBarColor,
    foregroundColor: AppColors.darkTextColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextColor, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(color: AppColors.darkTextColor, fontFamily: 'Poppins'),
    titleLarge: TextStyle(color: AppColors.darkTextColor, fontFamily: 'Poppins'),
  ),
);
