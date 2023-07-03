import 'package:bubble_tea_app/utils/colors.dart';
import 'package:flutter/material.dart';

class JTextFormFieldTheme {
  JTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
    prefixIconColor: jPrimaryLightContainerColor,
    floatingLabelStyle: const TextStyle(color: jPrimaryLightContainerColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: jPrimaryLightContainerColor),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
    prefixIconColor: jPrimaryDarkContainerColor,
    floatingLabelStyle: const TextStyle(color: jPrimaryDarkContainerColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: jPrimaryDarkContainerColor),
    ),
  );
}
