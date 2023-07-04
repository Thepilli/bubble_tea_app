import 'package:bubble_tea_app/models/drink_model.dart';
import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:bubble_tea_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TeaTile extends StatelessWidget {
  final DrinkModel drink;
  final void Function()? onTap;
  final IconData icon;
  const TeaTile({
    super.key,
    required this.onTap,
    required this.drink,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: jPadding5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: jPrimaryLightColor.withOpacity(.7), width: 1.5),
            borderRadius: BorderRadius.circular(jBorderRadius),
            color: jPrimaryLightContainerColor,
          ),
          child: ListTile(
            title: Text(drink.name, style: Theme.of(context).textTheme.headlineSmall),
            subtitle: Text(drink.price, style: Theme.of(context).textTheme.headlineSmall),
            leading: Image.asset(drink.imgPath),
            trailing: Icon(icon, color: jPrimaryLightColor),
          ),
        ),
      ),
    );
  }
}
