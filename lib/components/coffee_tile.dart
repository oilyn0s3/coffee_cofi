import 'package:coffee_cofi/const.dart';
import 'package:flutter/material.dart';

import '../models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  void Function()? onPressed;
  bool isCartPage;
  final Coffee coffee;
  IconData icon;
  String cartInfo(Coffee coffee, bool isCartPage) {
    return isCartPage ? '#${coffee.quantity}  Size "${coffee.size}"' : '';
  }

  CoffeeTile(
      {super.key,
      required this.icon,
      required this.isCartPage,
      required this.coffee,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            coffee.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${coffee.sign} ${coffee.price}'),
            Text(cartInfo(coffee, isCartPage)),
          ],
        ),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: Icon(icon, color: primaryColor),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
