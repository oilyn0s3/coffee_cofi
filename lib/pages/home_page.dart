import 'package:coffee_cofi/components/bottom_nav_bar.dart';
import 'package:coffee_cofi/const.dart';
import 'package:coffee_cofi/pages/cart_page.dart';
import 'package:coffee_cofi/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _pages[_selectedindex],
      bottomNavigationBar: MyBottomNavBar(onTapped: onTapped),
    );
  }
}
