import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      titleLarge: TextStyle(
          fontSize: 20.sp,
          fontFamily: 'Khula',
          color: AppColors.textWhite,
      ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      color:AppColors.textSecondary,
      fontFamily: 'Khula'
    ),

  );

  static TextTheme darkTextTheme = TextTheme(
    displayMedium: TextStyle(
      color: AppColors.textPrimary,
      fontFamily: 'Khula',
      letterSpacing: -0.4.w,
    ),
    labelMedium: TextStyle(
      color: AppColors.textSecondary,
      fontFamily: 'Khula',
      letterSpacing: -0.4.w,
    ),
    titleLarge: TextStyle(
      fontSize: 22.sp,
      fontFamily: 'Khula',
      color: AppColors.textPrimary
    ),
    titleMedium: TextStyle(
        fontSize: 15.sp,
        color:AppColors.textSecondary,
        fontFamily: 'Khula'
    ),
  );
}