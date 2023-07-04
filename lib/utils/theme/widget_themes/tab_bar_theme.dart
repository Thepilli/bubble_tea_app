import 'package:flutter/material.dart';
import 'package:bubble_tea_app/utils/constants/colors.dart';

class JTabBarTheme {
  JTabBarTheme._();

  static const lightTabBarTheme = TabBarTheme(
    indicatorColor: jPrimaryLightColor,
    labelColor: jScafoldDarkColor,
    unselectedLabelColor: jScafoldDarkColor,
  );

  static const darkTabBarTheme = TabBarTheme(
    indicatorColor: jPrimaryDarkColor,
    labelColor: Colors.white70,
    unselectedLabelColor: jPrimaryDarkColor,
  );
}
