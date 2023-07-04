import 'package:bubble_tea_app/components/tea_tile.dart';
import 'package:bubble_tea_app/models/bubble_tea_shop_model.dart';
import 'package:bubble_tea_app/models/drink_model.dart';
import 'package:bubble_tea_app/pages/core/order_page.dart';
import 'package:bubble_tea_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // go to order page when a drink is selected
  void goToOrderPage(DrinkModel drink) {
    // navigate to the order page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(drink: drink),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShopModel>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(jPadding25),
          child: Column(
            children: [
              // Shop heading
              Text('Bubble Tea Shop', style: Theme.of(context).textTheme.headlineMedium),

              // list of items for sale
              Expanded(
                child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                    // get individual drink from shop
                    DrinkModel individualDrink = value.shop[index];

                    //return each drink in a custom tile
                    return TeaTile(
                      icon: Icons.arrow_forward,
                      drink: individualDrink,
                      onTap: () => goToOrderPage(individualDrink),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
