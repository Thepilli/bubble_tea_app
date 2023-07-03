import 'package:flutter/material.dart';
import 'package:bubble_tea_app/utils/colors.dart';

class JFloatingActionButtonTheme {
  JFloatingActionButtonTheme._();

  static final lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: jPrimaryLightColor,
    foregroundColor: Colors.black54,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  static final darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: jPrimaryDarkColor,
    foregroundColor: Colors.white70,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
