// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble_tea_app/components/bottom_nav_bar.dart';
import 'package:bubble_tea_app/pages/core/cart_page.dart';
import 'package:bubble_tea_app/pages/core/shop_page.dart';
import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // user
  User? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // get the current user
  void getCurrentUser() {
    final auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      setState(() {
        currentUser = auth.currentUser;
      });
    }
  }

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
              title: Text('Your are about to be logged out', style: Theme.of(context).textTheme.bodyMedium),
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
        FirebaseAuth.instance.signOut();
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (currentUser != null)
                      Text(
                        'Logged in as: \n${currentUser!.email}',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),
                      ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundImage: currentUser!.isAnonymous
                          ? AssetImage('assets/icons/profile_anonymous.png')
                          : AssetImage('assets/icons/profile_bear.png'),
                    )
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
            )
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
