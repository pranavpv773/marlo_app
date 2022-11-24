// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:marlo_app/app/app_style/app_color/app_colors.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color: AppColors.kDark),
    scaffoldBackgroundColor: AppColors.kLight,
    primaryColor: AppColors.kLight,
    appBarTheme: AppBarTheme(
      // titleTextStyle: AppTextstyles.h1.copyWith(
      //   color: AppColors.kDark,
      // ),
      elevation: 0,
      color: AppColors.kLight,
    ),
    backgroundColor: AppColors.kLight,
    brightness: Brightness.light,
    highlightColor: AppColors.kDark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 10,
      backgroundColor: AppColors.primary,
      focusColor: Colors.blueAccent,
      splashColor: AppColors.primary,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.black),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kDark,
    appBarTheme: AppBarTheme(
      color: AppColors.kDark,
      elevation: 0,
    ),
    primaryColor: AppColors.kDark,
    brightness: Brightness.dark,
    highlightColor: Colors.white,
    backgroundColor: Colors.black54,
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: Colors.grey),
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
