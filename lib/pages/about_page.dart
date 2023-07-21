import 'package:coffee_cofi/const.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "About",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 30),
          Image.asset(
            "assets/logo.png",
            height: 200,
          ),
          const SizedBox(height: 40, width: double.infinity),
          Text(
            "Made by aNDy with ☕ ",
            style: TextStyle(fontSize: 22, color: secondaryTextColor),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "TODO Add Social Media and Contact Links.",
            style: TextStyle(fontSize: 10, color: secondaryTextColor),
          )
        ],
      ),
    );
  }
}
