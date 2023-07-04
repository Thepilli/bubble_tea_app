import 'package:bubble_tea_app/models/bubble_tea_shop_model.dart';
import 'package:bubble_tea_app/models/drink_model.dart';
import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:bubble_tea_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final DrinkModel drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  double pearlsValue = 0.5;
  void customizePearls(double newValue) {
    setState(() {
      pearlsValue = newValue;
    });
  }

  void addToCart() {
    // firstly, add to cart
    Provider.of<BubbleTeaShopModel>(context, listen: false).addToCart(widget.drink);

    // direct the user back to the shop page
    Navigator.pop(context);

    // let the user know the item was successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('${widget.drink.name} was added', style: Theme.of(context).textTheme.labelMedium),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: jPrimaryLightColor,
        title: Text(widget.drink.name),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: jDefaultSize,
          ),
          Center(child: SizedBox(height: 400, child: Image.asset(widget.drink.imgPath))),
          Padding(
            padding: const EdgeInsets.all(jPadding25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: jPadding5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100, child: Text('Sweetness')),
                      Expanded(
                        child: Slider(
                          thumbColor: jPrimaryLightColor,
                          activeColor: jPrimaryLightColor,
                          value: sweetValue,
                          label: sweetValue.toString(),
                          onChanged: (value) => customizeSweet(value),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: jPadding5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100, child: Text('Ice')),
                      Expanded(
                        child: Slider(
                          thumbColor: jPrimaryLightColor,
                          activeColor: jPrimaryLightColor,
                          value: iceValue,
                          label: iceValue.toString(),
                          onChanged: (value) => customizeIce(value),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: jPadding5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100, child: Text('Pearls')),
                      Expanded(
                        child: Slider(
                          thumbColor: jPrimaryLightColor,
                          activeColor: jPrimaryLightColor,
                          value: pearlsValue,
                          label: pearlsValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizePearls(value),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(onPressed: addToCart, child: const Text('Add to cart'))
        ],
      ),
    );
  }
}
