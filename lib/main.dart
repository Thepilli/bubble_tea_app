import 'package:bubble_tea_app/models/bubble_tea_shop_model.dart';
import 'package:bubble_tea_app/pages/home_page.dart';
import 'package:bubble_tea_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BubbleTeaShopModel(),
      builder: (context, child) => MaterialApp(
        title: 'Bubble Tea Application',
        debugShowCheckedModeBanner: false,
        theme: JAppTheme.lightTheme,
        darkTheme: JAppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: const HomePage(),
      ),
    );
  }
}
