// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble_tea_app/components/bottom_nav_bar.dart';
import 'package:bubble_tea_app/pages/cart_page.dart';
import 'package:bubble_tea_app/pages/shop_page.dart';
import 'package:bubble_tea_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // navigate the bottom bar
  void navigateBottomBar(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  void showAbout() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Your are about to be loged', style: Theme.of(context).textTheme.bodyMedium),
            ));
  }

  void loggout() {
    AwesomeDialog(
      context: context,
      keyboardAware: true,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      customHeader: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_NiUhhS.json'),
      animType: AnimType.BOTTOMSLIDE,
      btnCancelText: "No",
      btnOkText: "Yes,",
      title: 'Do you really want to logout?',
      titleTextStyle: Theme.of(context).textTheme.bodyMedium,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        // TODO: implement logout
      },
    ).show();
  }

  // pages to display
  final List<Widget> _pages = [
    // shop page
    ShopPage(),

    // cart page
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: jPrimaryLightContainerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset('assets/images/boba_shiba.png'),
                ),
                ListTile(
                  tileColor: Colors.transparent,
                  leading: Icon(Icons.home),
                  title: Text('Home', style: Theme.of(context).textTheme.labelMedium),
                ),
                ListTile(
                  onTap: () {
                    //TODO: implement routing
                    navigateBottomBar(1);
                  },
                  tileColor: Colors.transparent,
                  leading: Icon(Icons.info),
                  title: Text('About', style: Theme.of(context).textTheme.labelMedium),
                ),
              ],
            ),
            ListTile(
              enabled: true,
              onTap: () {
                loggout();
              },
              tileColor: Colors.transparent,
              leading: Icon(Icons.logout),
              title: Text('Logout', style: Theme.of(context).textTheme.labelMedium),
            ),
          ],
        ),
      ),
      backgroundColor: jScafoldLightColor,
      bottomNavigationBar: GnavBottomNavigationBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
