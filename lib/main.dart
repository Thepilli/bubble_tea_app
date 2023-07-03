import 'package:bubble_tea_app/firebase_options.dart';
import 'package:bubble_tea_app/models/bubble_tea_shop_model.dart';
import 'package:bubble_tea_app/pages/auth/auth.dart';
import 'package:bubble_tea_app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
          home: const AuthPage()),
    );
  }
}
