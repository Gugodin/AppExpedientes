import 'package:flutter/material.dart';

import '../../colors/colors.dart';

ThemeData themeAppLight = ThemeData(
    fontFamily: 'Quicksand',
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        surface: Colors.white,
        primary: MainColorsApp.primaryColor,
        secondary: MainColorsApp.secondaryColor,
        onPrimary: MainColorsApp.brightColor),
    scaffoldBackgroundColor: MainColorsApp.backgroundColor1,

    //APP BAR THEME
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    // TEXT FIELD DECORATION
    inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: Colors.black,
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    // PROGRESS INDICATOR THEME
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: MainColorsApp.brightColor),
    // TEXT THEME
    textTheme: const TextTheme(
        headlineMedium: TextStyle(color: Color(0xFFD9D9D9),fontSize: 25,fontWeight: FontWeight.bold),
        // LABELS
        labelLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        labelMedium: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        )));
