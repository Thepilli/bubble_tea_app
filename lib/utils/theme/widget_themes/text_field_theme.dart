import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class JTextFormFieldTheme {
  JTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
    prefixIconColor: jPrimaryLightContainerColor,
    hintStyle: const TextStyle(
      color: jPrimaryLightColor,
    ),
    floatingLabelStyle: const TextStyle(color: jPrimaryLightContainerColor),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(width: 2, color: jPrimaryLightColor),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
    prefixIconColor: jPrimaryDarkContainerColor,
    hintStyle: const TextStyle(
      color: jPrimaryDarkColor,
    ),
    floatingLabelStyle: const TextStyle(color: jPrimaryDarkContainerColor),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(width: 2, color: jPrimaryDarkColor),
    ),
  );
}
