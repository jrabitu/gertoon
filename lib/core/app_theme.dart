// lib/core/app_theme.dart

import 'package:flutter/material.dart';
import 'package:gertoon/core/app_colors.dart'; // Import our new colors

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryDeep,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.accentDeep, // Use a new color here
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(
        AppColors.primaryDeep.value,
        <int, Color>{
          50: AppColors.primaryDeep.withOpacity(0.1),
          100: AppColors.primaryDeep.withOpacity(0.2),
          200: AppColors.primaryDeep.withOpacity(0.3),
          300: AppColors.primaryDeep.withOpacity(0.4),
          400: AppColors.primaryDeep.withOpacity(0.5),
          500: AppColors.primaryDeep.withOpacity(0.6),
          600: AppColors.primaryDeep.withOpacity(0.7),
          700: AppColors.primaryDeep.withOpacity(0.8),
          800: AppColors.primaryDeep.withOpacity(0.9),
          900: AppColors.primaryDeep,
        },
      ),
    ).copyWith(
      secondary: AppColors.primaryVibrant,
    ),
  );
}