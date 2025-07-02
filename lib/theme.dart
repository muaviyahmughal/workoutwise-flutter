import 'package:flutter/material.dart';

class AppColors {
  static Color background = Colors.white;
  static Color primary = Colors.black;
  static Color accent = const Color(0xFF0C0CD4); // updated accent color
  static Color secondary = const Color(0xFFF7F7F7);
  static Color success = const Color(0xFF4ADE80); // green
  static Color warning = const Color(0xFFFFD600); // yellow
  static Color error = const Color(0xFFF87171);
  static Color disabled = const Color(0xFFBDBDBD);
}

final ThemeData workoutWiseTheme = ThemeData(
  fontFamily: 'Gontserrat',
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    surface: AppColors.background,
    error: AppColors.error,
    onPrimary: Colors.white,
    onSecondary: AppColors.primary,
    onSurface: AppColors.primary,
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    iconTheme: IconThemeData(color: AppColors.primary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      elevation: 0,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondary,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    labelStyle: TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.w500,
    ),
  ),
  cardTheme: CardThemeData(
    color: AppColors.secondary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 2,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.accent,
    unselectedItemColor: AppColors.disabled,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'HeadingFont',
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'HeadingFont',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Gontserrat',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Gontserrat',
      fontSize: 16,
      color: AppColors.primary,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Gontserrat',
      fontSize: 14,
      color: AppColors.primary,
    ),
  ),
);
