import 'package:flutter/material.dart';

import 'color_and_font.dart';

// Dark Theme Configuration
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  // Text theme applied to the body text
  textTheme: TextTheme().apply(bodyColor: ColorAndFont.iconColor),

  // Background color of the Scaffold
  scaffoldBackgroundColor: ColorAndFont.backgroundColor,

  // Primary color used throughout the app
  primaryColor: ColorAndFont.appBarColor,

  // Floating action button theme configuration
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorAndFont.backgroundColor,
  ),

  // Elevated button theme configuration
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(ColorAndFont.appBarColor),
    ),
  ),

  // Dialog theme configuration
  dialogTheme: DialogTheme(
    backgroundColor: ColorAndFont.backgroundColor,
  ),

  // Checkbox theme configuration
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all<Color>(
      ColorAndFont.backgroundColor,
    ),
    checkColor:
        WidgetStatePropertyAll(const Color.fromARGB(255, 250, 250, 250)),
    side: BorderSide.none,
  ),

  // App bar theme configuration
  appBarTheme: AppBarTheme(
    backgroundColor: ColorAndFont.appBarColor,
  ),

  // Input decoration theme configuration
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: ColorAndFont.appBarColor,
  ),
);

//....................................................................//
// Light Theme Configuration
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

// Text theme applied to the body text
  textTheme: TextTheme().apply(bodyColor: ColorAndFont.iconLightColor),

  // Background color of the Scaffold
  scaffoldBackgroundColor: ColorAndFont.backgroundLightColor,

  // Primary color used throughout the app
  primaryColor: ColorAndFont.appBarLightColor,

  // Floating action button theme configuration
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorAndFont.backgroundLightColor,
  ),

  // Elevated button theme configuration
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(ColorAndFont.appBarLightColor),
      textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black)),
    ),
  ),

  // Dialog theme configuration
  dialogTheme: DialogTheme(
    backgroundColor: ColorAndFont.backgroundLightColor,
  ),

  // Checkbox theme configuration
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all<Color>(
      ColorAndFont.appBarColor,
    ),
    side: BorderSide.none,
  ),

  // App bar theme configuration
  appBarTheme: AppBarTheme(
    backgroundColor: ColorAndFont.appBarLightColor,
  ),

  // Input decoration theme configuration
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: ColorAndFont.appBarLightColor,
  ),
);
