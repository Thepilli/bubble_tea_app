import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bubble_tea_app/components/button.dart';
import 'package:bubble_tea_app/components/square_tile.dart';
import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:bubble_tea_app/utils/constants/sizes.dart';
import 'package:bubble_tea_app/utils/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

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
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );

      //pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
      Navigator.pop(context);
      //display error message
      if (e.code == 'unknown') {
        displayErrorMessage('Email and password field are required');
      } else {
        displayErrorMessage(e.code);
      }
    }
    if (animationType == 'hands_up') {
      setState(() {
        animationType = 'hands_down';
      });
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

  // Teddy
  String animationType = 'idle';
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  FocusNode previousFocusNode = FocusNode();

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = 'hands_up';
        });
      } else {
        setState(() {
          animationType = 'hands_down';
        });
      }
      previousFocusNode = passwordFocusNode;
      if (previousFocusNode == passwordFocusNode) {
        previousFocusNode = usernameFocusNode;
      } else {
        previousFocusNode = passwordFocusNode;
      }
    });

    usernameFocusNode.addListener(() {
      // Check for the previous focus node and perform actions based on its value
      if (previousFocusNode == passwordFocusNode) {
        if (usernameFocusNode.hasFocus) {
          setState(() {
            animationType = 'hands_down';
          });
        } else {
          if (usernameFocusNode.hasFocus) {
            setState(() {
              animationType = 'idle';
            });
          } else {
            setState(() {
              animationType = 'hands_down';
            });
          }
        }
      }

      // Update the previous focus node with the current focus node
      previousFocusNode = usernameFocusNode;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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

                    SizedBox(
                      height: 150,
                      width: 300,
                      child: FlareActor(
                        'assets/animations/Teddy.flr',
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.contain,
                        animation: animationType,
                        callback: (animation) {
                          setState(() {
                            animationType = 'idle';
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: jDefaultSize),

                    // welcome back message
                    Text(
                      Strings.welcomeMessage,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),

                    const SizedBox(height: jDefaultSize),

                    // email TF
                    TextField(
                      focusNode: usernameFocusNode,
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
                      focusNode: passwordFocusNode,
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        alignLabelWithHint: true,
                        labelStyle: Theme.of(context).textTheme.labelSmall?.apply(fontSizeFactor: 1.2),
                        labelText: Strings.passwordLabel,
                      ),
                    ),
                    const SizedBox(height: jDefaultSize),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // forgot password?
                          Text(
                            Strings.forgotPasswordText,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: jDefaultSize),

                    // sign in button
                    MyButton(
                      text: Strings.signInButtonText,
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
                            child: Text(
                              Strings.continueWithText,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
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
                        SquareTile(imagePath: 'assets/icons/google.png'),

                        SizedBox(width: jDefaultSize),

                        // apple button
                        SquareTile(imagePath: 'assets/icons/google.png'),
                      ],
                    ),

                    const SizedBox(height: jDefaultSize),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.notMemberText, style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(Strings.registerNowText, style: Theme.of(context).textTheme.bodySmall),
                        ),
                      ],
                    ),
                    const SizedBox(height: jDefaultSizeSmall),
                    // wanna give it a try?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.tryItText,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: loginAnonym,
                          child: Text(
                            Strings.continueAnonymouslyText,
                            style: Theme.of(context).textTheme.bodySmall?.apply(color: jLinkLightColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
