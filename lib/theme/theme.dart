import 'package:flutter/material.dart';

// Define your light and dark theme data
final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold), // Formerly headline1
    displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold), // Formerly headline2
    displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold), // Formerly headline3
    bodyLarge:
        TextStyle(color: Colors.black, fontSize: 16), // Formerly bodyText1
    bodyMedium:
        TextStyle(color: Colors.black54, fontSize: 14), // Formerly bodyText2
    titleLarge:
        TextStyle(color: Colors.black54, fontSize: 16), // Formerly subtitle1
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(color: Colors.blue),
  dividerColor: Colors.grey[300],
  cardTheme: CardTheme(
    color: Colors.grey[200],
  ),
  // Add other theme properties as needed
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 0, 170, 255),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold), // Formerly headline1
    displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold), // Formerly headline2
    displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold), // Formerly headline3
    bodyLarge:
        TextStyle(color: Colors.white, fontSize: 16), // Formerly bodyText1
    bodyMedium:
        TextStyle(color: Colors.white70, fontSize: 14), // Formerly bodyText2
    titleLarge:
        TextStyle(color: Colors.white70, fontSize: 16), // Formerly subtitle1
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: const IconThemeData(color: Colors.blueAccent),
  dividerColor: Colors.grey[700],
  cardColor: Colors.black,
  cardTheme: const CardTheme(
    color: Colors.white,
  ), // Add other theme properties as needed
);
