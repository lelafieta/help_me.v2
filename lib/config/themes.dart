import 'package:flutter/material.dart';
import 'package:help_me/config/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  hintColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.whiteColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textColor, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(color: AppColors.textColor, fontFamily: 'Poppins'),
    titleLarge: TextStyle(color: AppColors.textColor, fontFamily: 'Poppins'),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  hintColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.blackColor60,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.blackColor,
    foregroundColor: AppColors.whiteColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.whiteColor, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(color: AppColors.whiteColor, fontFamily: 'Poppins'),
    titleLarge: TextStyle(color: AppColors.whiteColor, fontFamily: 'Poppins'),
  ),
);
