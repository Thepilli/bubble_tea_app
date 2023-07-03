import 'package:bubble_tea_app/utils/colors.dart';
import 'package:bubble_tea_app/utils/sizes.dart';
import 'package:flutter/material.dart';

class JElevatedButtonTheme {
  JElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(100, jButtonHeight),
      shape: const StadiumBorder(),
      foregroundColor: jScafoldDarkColor,
      backgroundColor: jPrimaryLightColor,
      side: const BorderSide(color: jPrimaryLightColor, width: 3),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(100, jButtonHeight),
      shape: const StadiumBorder(),
      foregroundColor: Colors.white70,
      backgroundColor: jPrimaryDarkColor,
      side: const BorderSide(color: jPrimaryDarkContainerColor, width: 3),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
}
