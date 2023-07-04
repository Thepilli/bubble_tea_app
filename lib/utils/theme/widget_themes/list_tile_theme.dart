import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class JListTileTheme {
  JListTileTheme._();

  static final lightListTileTheme = ListTileThemeData(
      horizontalTitleGap: 20,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: jPrimaryLightColor);

  static final darkListTileTheme = ListTileThemeData(
      horizontalTitleGap: 20,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: jPrimaryDarkColor);
}
