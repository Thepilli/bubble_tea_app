// ignore_for_file: prefer_const_constructors

import 'package:bubble_tea_app/components/bottom_nav_bar.dart';
import 'package:bubble_tea_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jScafoldLightColor,
      bottomNavigationBar: GnavBottomNavigationBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
