import 'package:flutter/material.dart';

class MythemeData {
  static Color lightPriamry = Color.fromARGB(255, 95, 152, 235);
  static Color darkPriamary = Color.fromARGB(255, 21, 28, 49);
  static Color lightGreen = Color.fromARGB(255, 222, 234, 217);
  static Color colorWhite = Color.fromARGB(255, 255, 255, 255);
  static Color colorBlack = Color.fromARGB(255, 45, 52, 54);
  static Color colorRed = Color.fromARGB(255, 241, 72, 86);
  static Color colorGreen = Color.fromARGB(255, 96, 228, 103);

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightPriamry,
      scaffoldBackgroundColor: lightGreen,
      appBarTheme: AppBarTheme(
        backgroundColor: lightPriamry,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          selectedItemColor: lightPriamry,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightPriamry,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: colorWhite, width: 4),
            borderRadius: BorderRadius.circular(30)),
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: colorWhite),
          bodySmall: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: lightPriamry),
          displayMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: colorBlack)));

  static ThemeData darkTheme = ThemeData(
      primaryColor: darkPriamary, scaffoldBackgroundColor: colorWhite);
}
