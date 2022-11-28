import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color defaultColor=Colors.blue;
ThemeData lightThemeData=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: defaultColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30
    ),
    elevation: 0,
    titleSpacing: 20,

    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
  ),
  accentIconTheme: const IconThemeData.fallback(
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold
    ),
    backgroundColor: Colors.grey[300],
    unselectedLabelStyle: TextStyle(fontSize: 13),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey[800],
    elevation: 20,

  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black
    ),
    subtitle1: TextStyle(
      fontSize: 14,
      color: Colors.black54
    )
  )
);