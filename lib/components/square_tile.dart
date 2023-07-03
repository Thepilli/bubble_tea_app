import 'package:bubble_tea_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: jPrimaryLightColor.withOpacity(0.5), width: 3),
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
        width: 40,
      ),
    );
  }
}
