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
      hintStyle: TextStyle(
          color: MainColorsApp.brightColorText.withOpacity(0.3), fontSize: 20),
      fillColor: MainColorsApp.backgroundColorTextFields,
      filled: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      errorStyle: TextStyle(color: Colors.red.shade500, fontSize: 13),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.withOpacity(0.5), width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.withOpacity(0.5), width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    ),
    // PROGRESS INDICATOR THEME
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: MainColorsApp.brightColor),

    // TEXT BUTTON
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          
            textStyle: WidgetStatePropertyAll(TextStyle(
                fontSize: 16,
                color: MainColorsApp.brightColorText,
                
                decoration: TextDecoration.underline,
                decorationColor: MainColorsApp.brightColorText,
                fontWeight: FontWeight.bold)))),

    // TEXT THEME
    textTheme: const TextTheme(
        headlineMedium: TextStyle(
            color: MainColorsApp.brightColorText,
            fontSize: 25,
            fontWeight: FontWeight.bold),
        // LABELS
        labelLarge:
            TextStyle(fontSize: 20, color: MainColorsApp.brightColorText),
        labelMedium: TextStyle(
            fontSize: 16,
            color: MainColorsApp.brightColorText,
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
          color: MainColorsApp.brightColorText,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        )));
