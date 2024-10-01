import 'package:flutter/material.dart';
import 'package:flux_weather_app/core/styles/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    IconThemeData iconThemeData =
        const IconThemeData(color: AppColors.iconColor, size: 30);
    return ThemeData(
      fontFamily: "RobotoSlab",
      primarySwatch: Colors.blue,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.transparent, elevation: 0, iconTheme: iconThemeData),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontSize: 18,
          color: Colors.white70,
        ),
        bodyLarge: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w300,
            color: AppColors.textColor),
        bodyMedium: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor),
        bodySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor),
      ),
      iconTheme: iconThemeData,
    );
  }
}
