import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class InputTheme {
  InputTheme._();

  static InputDecorationTheme lightInputTheme = InputDecorationTheme();

  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    constraints: BoxConstraints(
      minHeight: 56,
      maxWidth: 600,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.borderError,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: AppColors.btnInputField,
    prefixIconColor: Colors.white,
    hintStyle: TextStyle(
      color: AppColors.textSecondary,
      fontSize: 15,
      letterSpacing: -0.4,
    ),
  );
}
