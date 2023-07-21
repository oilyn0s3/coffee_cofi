import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int) onTapped;
  MyBottomNavBar({super.key, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(26),
      child: GNav(
        //padding: const EdgeInsets.all(16),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        onTabChange: (index) => onTapped(index),
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 24,
        textSize: 18,
        tabActiveBorder: Border.all(color: Colors.white),
        tabs: const [
          GButton(
            gap: 8,
            // textSize: 16,
            icon: Icons.home_rounded, // CupertinoIcons.house_alt_fill,
            text: "Shop",
          ),
          GButton(
            gap: 8,
            icon: CupertinoIcons.bag, //Icons.shopping_bag_outlined,
            text: "Cart",
          ),
        ],
      ),
    );
  }
}
