import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const MyButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(300, 70)),
      onPressed: onPressed,
      child: SizedBox(
          child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      )),
    );
  }
}
