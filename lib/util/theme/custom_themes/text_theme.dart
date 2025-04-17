import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      titleLarge: const TextStyle(
          fontSize: 22,
          fontFamily: 'SansFran',
          color: AppColors.textPrimary
      ),
    titleMedium: const TextStyle(
      fontSize: 15,
      color:AppColors.textSecondary,
      fontFamily: 'SansFran'
    ),

  );

  static TextTheme darkTextTheme = TextTheme(
    displayMedium: TextStyle(
      color: AppColors.textPrimary,
      fontFamily: 'SansFran',
      letterSpacing: -0.4,
    ),
    labelMedium: TextStyle(
      color: AppColors.textSecondary,
      fontFamily: 'SansFran',
      letterSpacing: -0.4,
    ),
    titleLarge: const TextStyle(
      fontSize: 22,
      fontFamily: 'SansFran',
      color: AppColors.textPrimary
    ),
    titleMedium: const TextStyle(
        fontSize: 15,
        color:AppColors.textSecondary,
        fontFamily: 'SansFran'
    ),
  );
}