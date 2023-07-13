import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble_tea_app/components/button.dart';
import 'package:bubble_tea_app/components/sized_box.dart';
import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:bubble_tea_app/utils/constants/sizes.dart';
import 'package:bubble_tea_app/utils/constants/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

//sign in function
  void signUp() async {
//show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

//check if passwords match
    if (passwordTextController.text.trim() != confirmPasswordTextController.text.trim()) {
      //pop loading circle
      Navigator.pop(context);

      //display error message
      displayErrorMessage(Strings.noMatchPasswordText);
    } else {
      //try to create a new user
      try {
        // create a new user
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim(),
        );

        //after creating a new user, create a new document in the cloud firestore collection called Users
        FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.email).set({
          'username': emailTextController.text.split('@')[0], //initial username
          'bio': 'empty bio...', //initial bio
          //add more fields here when needed
        });

        //pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);
        //display error message
        displayErrorMessage(e.code);
      }
    }
  }

  //display error message dialog
  void displayErrorMessage(String message) {
    AwesomeDialog(
      context: context,
      dialogBackgroundColor: jPrimaryLightContainerColor,
      dialogType: DialogType.WARNING,
      animType: AnimType.BOTTOMSLIDE,
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: jScafoldLightColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  const MySizedBox50(),
                  const SizedBox(height: 150, child: Image(image: AssetImage('assets/images/boba_shiba.png'))),

                  const MySizedBox50(),

                  // welcome back message
                  Text(
                    Strings.welcomeRegisterMessage,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  const MySizedBox25(),

                  // email TF
                  TextField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      alignLabelWithHint: true,
                      labelStyle: Theme.of(context).textTheme.labelSmall?.apply(fontSizeFactor: 1.2),
                      labelText: Strings.emailLabel,
                    ),
                  ),
                  const SizedBox(height: jDefaultSizeSmall),

                  // password TF
                  TextField(
                    controller: passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      alignLabelWithHint: true,
                      labelStyle: Theme.of(context).textTheme.labelSmall?.apply(fontSizeFactor: 1.2),
                      labelText: Strings.passwordLabel,
                    ),
                  ),
                  const SizedBox(height: jDefaultSizeSmall),
                  TextField(
                    controller: confirmPasswordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      alignLabelWithHint: true,
                      labelStyle: Theme.of(context).textTheme.labelSmall?.apply(fontSizeFactor: 1.2),
                      labelText: Strings.confirmPasswordLabel,
                    ),
                  ),
                  const SizedBox(height: jDefaultSizeSmall),

                  // sign in button
                  MyButton(
                    text: Strings.signUpButtonText,
                    onPressed: signUp,
                  ),
                  const MySizedBox25(),
                  // go to register page

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.alreadyHaveAccountText,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          Strings.loginNowText,
                          style: Theme.of(context).textTheme.bodySmall?.apply(color: jLinkLightColor),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, '/register');
                      //   },
                      //   child: const Text('Register'),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
