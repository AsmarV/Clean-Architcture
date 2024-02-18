import 'package:flutter/material.dart';

import '../core/core.export.dart';



ThemeData light = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const  TextTheme(
    titleLarge: TextStyle(
      color: primaryColor,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: accentColor,
    textTheme: ButtonTextTheme.primary,
  ),
);