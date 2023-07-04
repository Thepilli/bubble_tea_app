import 'package:bubble_tea_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:bubble_tea_app/utils/theme/widget_themes/expansion_tile_theme.dart';
import 'package:bubble_tea_app/utils/theme/widget_themes/fab_theme.dart';
import 'package:bubble_tea_app/utils/theme/widget_themes/list_tile_theme.dart';
import 'package:bubble_tea_app/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:bubble_tea_app/utils/theme/widget_themes/text_field_theme.dart';
import 'package:bubble_tea_app/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'widget_themes/tab_bar_theme.dart';

class JAppTheme {
  JAppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: jScafoldLightColor,
    brightness: Brightness.light,
    textTheme: JTextTheme.lightTextTheme,
    elevatedButtonTheme: JElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.lightInputDecorationTheme,
    listTileTheme: JListTileTheme.lightListTileTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: JFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    tabBarTheme: JTabBarTheme.lightTabBarTheme,
    expansionTileTheme: JExpansionTileTheme.lightExpansionTileTheme,
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: jScafoldDarkColor,
    brightness: Brightness.dark,
    textTheme: JTextTheme.darkTextTheme,
    elevatedButtonTheme: JElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.darkInputDecorationTheme,
    listTileTheme: JListTileTheme.darkListTileTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: JFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    tabBarTheme: JTabBarTheme.darkTabBarTheme,
    expansionTileTheme: JExpansionTileTheme.darkExpansionTileTheme,
  );
}
