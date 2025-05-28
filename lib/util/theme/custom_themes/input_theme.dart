import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class InputTheme {
  InputTheme._();

  static InputDecorationTheme lightInputTheme = InputDecorationTheme();

  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    constraints: BoxConstraints(
      minHeight: 56.h,
      maxWidth: 600.w,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(
        color: AppColors.borderError,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: AppColors.btnInputField,
    prefixIconColor: Colors.white,
    hintStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 15.sp,
      letterSpacing: -0.4.w,
    ),
  );
}
