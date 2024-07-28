import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color.fromARGB(137, 0, 0, 0),
    secondary: Colors.blue,
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: 
    Colors.grey.shade900,
    primary: Colors.white,
    secondary: Colors.blue,
  )
);