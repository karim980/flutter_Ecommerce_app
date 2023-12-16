import 'package:flutter/material.dart';

import 'colors/app_color.dart';

final primaryColor = AppColors.backColor;
final secondaryColor = AppColors.splashColor;

final appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      toolbarHeight: 75,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black,size: 30),
      backgroundColor: AppColors.backColor,
      centerTitle: true,
    ),
    iconTheme: IconThemeData(color: Colors.grey[700]),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      headline2: TextStyle(fontSize: 20),
      bodyText1: TextStyle(
          color: AppColors.yllColor, fontWeight: FontWeight.w300, fontSize: 20),
      bodyText2: TextStyle( fontSize: 20,),
      subtitle1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: AppColors.backColor),
      headline5: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: AppColors.backColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15,horizontal: 50)),
            elevation: MaterialStatePropertyAll(4),
            backgroundColor: MaterialStatePropertyAll(primaryColor))),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(hintStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: primaryColor),
        iconColor: secondaryColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        )));
