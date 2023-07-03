import 'package:bubble_tea_app/models/drink_model.dart';
import 'package:flutter/material.dart';

class BubbleTeaShopModel extends ChangeNotifier {
  // list of drinks for sale
  final List<DrinkModel> _shop = [
    DrinkModel(name: 'Strawberry Boba Tea', price: '4.00', imgPath: 'assets/images/boba_1.png'),
    DrinkModel(name: 'Chocolate Boba Tea', price: '4.00', imgPath: 'assets/images/boba_2.png'),
    DrinkModel(name: 'Matcha Boba Tea', price: '4.00', imgPath: 'assets/images/boba_3.png'),
    DrinkModel(name: 'Caramel Boba Tea', price: '4.00', imgPath: 'assets/images/boba_4.png'),
  ];

  // list of drinks in user cart
  final List<DrinkModel> _userCart = [];

  // get drinks for sale
  List<DrinkModel> get shop => _shop;

  // get user cart
  List<DrinkModel> get cart => _userCart;

  // add drinks to cart
  void addToCart(DrinkModel drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drinks from cart
  void removeFromCart(DrinkModel drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
