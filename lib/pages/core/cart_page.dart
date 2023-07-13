import 'package:bubble_tea_app/components/tea_tile.dart';
import 'package:bubble_tea_app/models/bubble_tea_shop_model.dart';
import 'package:bubble_tea_app/models/drink_model.dart';
import 'package:bubble_tea_app/utils/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeFromCart(DrinkModel drink) {
    Provider.of<BubbleTeaShopModel>(context, listen: false).removeFromCart(drink);
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShopModel>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(jPadding25),
                child: Column(
                  children: [
                    // heading
                    Text('Your Cart', style: Theme.of(context).textTheme.headlineMedium),

                    // list of items
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          // get individual drink from shop
                          DrinkModel drinkFromCart = value.cart[index];
                          return TeaTile(
                              onTap: () => removeFromCart(drinkFromCart), drink: drinkFromCart, icon: Icons.remove_shopping_cart);
                        },
                      ),
                    ),
                    //pay button
                    ElevatedButton(onPressed: logout, child: const Text('Pay'))
                  ],
                ),
              ),
            ));
  }
}
