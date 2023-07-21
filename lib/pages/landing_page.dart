import 'package:coffee_cofi/const.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/coffee-menu.png', height: 200),
            const SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Text(
              "Brew Day",
              style: const TextStyle().copyWith(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              "How do you like your coffee?",
              style: TextStyle(color: primaryColor, fontSize: 16),
            ),
            const SizedBox(height: 50),
            TextButton(
              style: TextButton.styleFrom(
                // minimumSize: const Size(10, 50),
                padding: const EdgeInsets.all(16),
                foregroundColor: primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter Shop",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       padding: const EdgeInsets.all(20),
            //       backgroundColor: primaryColor,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       // minimumSize: const Size(double.infinity, 60),
            //     ),
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const HomePage(),
            //       ));
            //     },
            //     child: const Text(
            //       "Enter Shop",
            //       style: TextStyle(fontSize: 16),
            //     )),
          ],
        ),
      ),
    );
  }
}
