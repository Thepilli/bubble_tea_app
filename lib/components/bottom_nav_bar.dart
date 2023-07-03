// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bubble_tea_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GnavBottomNavigationBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const GnavBottomNavigationBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: jPrimaryLightColor,
        color: jgrey300,
        tabActiveBorder: Border.all(color: jPrimaryLightColor),
        gap: 10,
        tabs: [
          GButton(text: 'Shop', icon: Icons.home),
          GButton(text: 'Cart', icon: Icons.shopping_bag),
        ],
      ),
    );
  }
}
