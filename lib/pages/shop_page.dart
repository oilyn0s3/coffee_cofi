import 'package:coffee_cofi/components/coffee_tile.dart';
import 'package:coffee_cofi/models/coffee_shop.dart';
import 'package:coffee_cofi/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add to the cart

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, coffee, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            children: [
              const Text(
                "How would you like your Coffee?",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: coffee.coffeeShop.length,
                  itemBuilder: (context, index) {
                    Coffee oneCoffee = coffee.coffeeShop[index];

                    // return coffee tile
                    return CoffeeTile(
                        icon: Icons.arrow_forward_ios_rounded,
                        isCartPage: false,
                        coffee: oneCoffee,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductPage(coffee: oneCoffee),
                            ),
                          );
                        } // () => addToCart(oneCoffee),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
