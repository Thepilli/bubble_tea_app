import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tea_app/utils/constants/sizes.dart';

class JOutlinedButtonTheme {
  JOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jPrimaryLightContainerColor,
      side: const BorderSide(color: jPrimaryLightContainerColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const StadiumBorder(),
      foregroundColor: jPrimaryDarkContainerColor,
      side: const BorderSide(color: jPrimaryDarkContainerColor),
      padding: const EdgeInsets.symmetric(vertical: jButtonHeight),
    ),
  );
}
