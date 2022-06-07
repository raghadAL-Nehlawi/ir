import 'package:flutter/material.dart';

MaterialColor primarySwatch = const MaterialColor(0xff209EDA, {
  50:  Color(0xff209EDA),
  100: Color(0xff209EDA),
  200: Color(0xff209EDA),
  300: Color(0xff209EDA),
  400: Color(0xff209EDA),
  500: Color(0xff209EDA),
  600: Color(0xff209EDA),
  700: Color(0xff209EDA),
  800: Color(0xff209EDA),
  900: Color(0xff209EDA),
});



Color lightBackgroundColor = Color(0xff209EDA);
Color darkGrey = const Color(0xFF9D9D9D);
Color lightGray = const Color(0xFFF3F3F3);
Color goldColor = const Color(0xFFFFD700);
ThemeData lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    primaryColor: primarySwatch,
    scaffoldBackgroundColor: Colors.white,
    accentColor: Colors.white,
    selectedRowColor: darkGrey,
    backgroundColor: lightBackgroundColor.withOpacity(0.75),
    cardColor: primarySwatch,
    shadowColor:  Colors.grey.withOpacity(0.3),
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        foregroundColor: Colors.black,
        backgroundColor: lightBackgroundColor.withOpacity(0.75))
);



ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
    primarySwatch: primarySwatch,
    primaryColor: primarySwatch,
    selectedRowColor: Colors.grey[50],
    accentColor: Colors.black.withOpacity(0.5),
    scaffoldBackgroundColor: Color(0xFF2B2B2B),
    backgroundColor: lightBackgroundColor.withOpacity(0.75),
    cardColor: primarySwatch,
    shadowColor:  Colors.white.withOpacity(0.3),
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        foregroundColor: Colors.white,
        backgroundColor: lightBackgroundColor.withOpacity(0.75))
);
