// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/payment_screen/payment_screen.dart';
import 'package:project2/view/widgets/large_text.dart';

class TotalAndContinue extends StatelessWidget {
  Function() onTap;
  TotalAndContinue({super.key, required this.size, required this.onTap});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LargeText(
            text: "Total : 90₹",
            fontSize: 20,
            letterSpacing: -1,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: size.width / 9,
              width: size.width / 2,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: LargeText(
                  text: "Continue",
                  letterSpacing: -2,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: dark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
