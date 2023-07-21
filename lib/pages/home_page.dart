import 'package:coffee_cofi/components/bottom_nav_bar.dart';
import 'package:coffee_cofi/const.dart';
import 'package:coffee_cofi/pages/about_page.dart';
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
      appBar: AppBar(
        leadingWidth: 70,
        iconTheme: IconThemeData(color: secondaryTextColor),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 150,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.home_rounded),
                        SizedBox(width: 20),
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.info_rounded),
                        SizedBox(width: 20),
                        Text(
                          "About",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app_rounded),
                    SizedBox(width: 20),
                    Text(
                      "Log Out",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: _pages[_selectedindex],
      bottomNavigationBar: MyBottomNavBar(onTapped: onTapped),
    );
  }
}
