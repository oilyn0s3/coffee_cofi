import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffee_tile.dart';
import '../const.dart';
import '../models/coffee.dart';
import '../models/coffee_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void emptyCart() {
    Provider.of<CoffeeShop>(context, listen: false).checkOut();
    // Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            // contentPadding: const EdgeInsets.only(top: 10),
            icon: Icon(
              Icons.check_circle_rounded,
              color: primaryColor,
              size: 36,
            ),
            title: Text(
              "Payment was successful!",
              style: TextStyle(
                  fontSize: 18,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w600),
            ),
            content: Text(
              "Your order is confirmed.",
              style: TextStyle(color: secondaryTextColor),
              textAlign: TextAlign.center,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, coffee, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: onEmptyCart(
                  coffee.userCart,
                  calculateTotal(
                    coffee.userCart,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  // textStyle: const TextStyle().copyWith(fontSize: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: coffee.userCart.isEmpty
                    ? null
                    : () {
                        setState(() {
                          emptyCart();
                        });
                      },
                child: Text(
                  "Proceed to Checkout",
                  style: const TextStyle().copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget onEmptyCart(
    List<Coffee> userCart,
    int total,
  ) {
    void removeFromCart(Coffee coffee) {
      Provider.of<CoffeeShop>(context, listen: false).removeItem(coffee);
    }

    return userCart.isEmpty
        ? Center(
            child: Text(
              "Cart is empty 😥, try adding some Coffee!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, color: secondaryTextColor),
            ),
          )
        : Column(
            children: [
              const Text(
                "Your cart",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    Coffee oneCoffee = userCart[index];
                    return CoffeeTile(
                      icon: Icons.delete_outline_rounded,
                      isCartPage: true,
                      coffee: oneCoffee,
                      onPressed: () {
                        removeFromCart(oneCoffee);
                      },
                      // () => addToCart(oneCoffee),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: secondaryTextColor,
                height: 2,
                width: double.infinity,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: const TextStyle()
                        .copyWith(fontSize: 16, color: secondaryTextColor),
                  ),
                  Text(
                    "${userCart[0].sign} $total",
                    style: const TextStyle()
                        .copyWith(fontSize: 16, color: secondaryTextColor),
                  ),
                ],
              ),
            ],
          );
  }

  int calculateTotal(List<Coffee> userCart) {
    Map<String, int> sizeChart = {
      'S': 1,
      'M': 2,
      'L': 3,
    };
    int total = 0;

    for (var coffee in userCart) {
      total += coffee.price * coffee.quantity! * sizeChart[coffee.size]!.abs();
    }

    return total;
  }
}
