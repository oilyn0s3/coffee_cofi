import 'package:coffee_cofi/const.dart';
import 'package:coffee_cofi/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ProductPage extends StatefulWidget {
  final Coffee coffee;

  const ProductPage({
    super.key,
    required this.coffee,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  String size = 'S';
  void addToCart(Coffee coffee, int quantity, String size) {
    Provider.of<CoffeeShop>(context, listen: false)
        .addItem(coffee, quantity, size);
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            icon: Icon(
              Icons.info_rounded,
              color: primaryColor,
              size: 36,
            ),
            title: Text(
              "${coffee.name} was successfully added to cart!",
              style: TextStyle(fontSize: 18, color: secondaryTextColor),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          widget.coffee.name,
          style: const TextStyle().copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        iconTheme: IconThemeData(color: Colors.grey[700]),
      ),
      body: Container(
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  widget.coffee.imagePath,
                  height: 140,
                  //fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),
                Text(
                  "Quantity",
                  style: const TextStyle().copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize: 25,
                      color: Colors.grey[600]),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => setState(() {
                        quantity > 1 ? quantity-- : null;
                      }),
                      icon: const Icon(Icons.remove),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      //padding: const EdgeInsets.all(),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle().copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        quantity < 12 ? quantity++ : null;
                      }),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Size",
                  style: const TextStyle().copyWith(
                      fontWeight: FontWeight.w100,
                      fontSize: 25,
                      color: Colors.grey[600]),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    choiceChip(
                        "S", size, (value) => setState(() => size = 'S')),
                    const SizedBox(width: 10),
                    choiceChip(
                        "M", size, (value) => setState(() => size = 'M')),
                    const SizedBox(width: 10),
                    choiceChip(
                        "L", size, (value) => setState(() => size = 'L')),
                  ],
                )
              ],
            ),
            //const SizedBox(height: 0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.all(20),
                backgroundColor: primaryColor,
                // textStyle: const TextStyle().copyWith(fontSize: 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                "Add to cart",
                style: const TextStyle().copyWith(fontSize: 16),
              ),
              onPressed: () {
                addToCart(widget.coffee, quantity, size);
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget choiceChip(String label, String size, void Function(bool) onTap) {
  return ChoiceChip(
    label: Text(
      label,
      style: TextStyle(
        fontSize: 16,
        color: size == label ? Colors.grey[200] : Colors.grey[700],
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.grey[200],
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    selectedColor: primaryColor,
    disabledColor: Colors.grey[200],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
    selected: size == label,
    onSelected: onTap,
  );
}
