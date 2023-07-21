// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    Coffee('Latte', '🌈', 799, null, null, 'assets/images/coffee-latte.png'),
    Coffee('Expresso', '🌈', 599, null, null, 'assets/images/expresso.png'),
    Coffee('Hot Tea', '🌈', 399, null, null, 'assets/images/hot-tea.png'),
    Coffee(
        'Cold Coffee', '🌈', 499, null, null, 'assets/images/cold-coffee.png'),
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add to cart
  void addItem(Coffee coffee, int quantity, String size) {
    _userCart.add(
      Coffee(
        coffee.name,
        coffee.sign,
        coffee.price,
        quantity,
        size,
        coffee.imagePath,
      ),
    );
    notifyListeners();
  }

  // remove from cart

  void removeItem(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  // lazy check
}
