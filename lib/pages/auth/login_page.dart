import 'package:bubble_tea_app/components/button.dart';
import 'package:bubble_tea_app/components/square_tile.dart';
import 'package:bubble_tea_app/utils/colors.dart';
import 'package:bubble_tea_app/utils/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailTextConroller = TextEditingController();
  final passwordTextConroller = TextEditingController();

//sign in function
  void signIn() async {
//show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextConroller.text,
        password: passwordTextConroller.text,
      );

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //display error message
      displayErrorMessage(e.code);
    }
  }

  //display error message dialog
  void displayErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  // anonymous sign-in function
  void loginAnonym() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // sign in anonymously
      await FirebaseAuth.instance.signInAnonymously();

      // pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading circle
      Navigator.pop(context);
      // display error message
      displayErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jScafoldLightColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  const SizedBox(height: jDefaultSize),

                  const SizedBox(height: 150, child: Image(image: AssetImage('assets/images/boba_shiba.png'))),

                  const SizedBox(height: jDefaultSize),

                  // welcome back message
                  Text(
                    // 'Get ready to tapioca-wesome adventures!',
                    'Sip, smile, boba-style!',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),

                  const SizedBox(height: jDefaultSize),

                  // email TF
                  TextField(
                    controller: emailTextConroller,
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      alignLabelWithHint: true,
                      labelStyle: Theme.of(context).textTheme.labelSmall?.apply(fontSizeFactor: 1.2),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: jDefaultSizeSmall),

                  // password TF
                  TextField(
                    controller: passwordTextConroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      alignLabelWithHint: true,
                      labelStyle: Theme.of(context).textTheme.labelSmall?.apply(fontSizeFactor: 1.2),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: jDefaultSize),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: jDefaultSize),

                  // sign in button
                  MyButton(
                    text: 'Sign In',
                    onPressed: signIn,
                  ),
                  const SizedBox(height: jDefaultSize),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('Or continue with', style: Theme.of(context).textTheme.bodySmall),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: jDefaultSize),

                  // google + apple sign in buttons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      SquareTile(imagePath: 'assets/images/google.png'),

                      SizedBox(width: jDefaultSize),

                      // apple button
                      SquareTile(imagePath: 'assets/images/google.png')
                    ],
                  ),

                  const SizedBox(height: jDefaultSize),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member?', style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Register now', style: Theme.of(context).textTheme.bodySmall),
                      ),
                    ],
                  ),

                  const SizedBox(height: jDefaultSizeSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Wanna give it a try?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: loginAnonym,
                        child: Text('Continue anonymously',
                            style: Theme.of(context).textTheme.bodySmall?.apply(color: jLinkLightColor)),
                      ),
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
