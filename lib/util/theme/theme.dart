import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/button_theme.dart';
import 'custom_themes/input_theme.dart';
import 'custom_themes/text_theme.dart';


class AppTheme {
  AppTheme._();

  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    textTheme: AppTextTheme.lightTextTheme,
    appBarTheme: AppAppbarTheme.lightAppbarTheme,
    buttonTheme: AppButtonTheme.lightButtonTheme,
    inputDecorationTheme: InputTheme.lightInputTheme,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    fontFamily: 'Khula',



  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: AppTextTheme.darkTextTheme,
    buttonTheme: AppButtonTheme.darkButtonTheme,
    inputDecorationTheme: InputTheme.darkInputTheme,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    fontFamily: 'Khula',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide.none,
        ),
        backgroundColor: AppColors.btnGrey,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        minimumSize: Size(0, 48),
        maximumSize: Size(600, 48),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgPrimary,

    ),

    dialogTheme: DialogTheme(
      backgroundColor: AppColors.bgAlert,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,


    ),


  );
}
