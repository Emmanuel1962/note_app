import 'package:flutter/material.dart';

// light theme
ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade800));

//dark mode

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: const Color.fromARGB(255, 26, 25, 25),
        primary: const Color.fromARGB(255, 26, 25, 25),
        secondary: Color.fromARGB(255, 15, 15, 15),
        inversePrimary: Colors.grey.shade300));
