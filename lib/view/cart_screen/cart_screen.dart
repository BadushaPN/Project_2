import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/cart_screen/widgets/cart_list.dart';
import 'package:project2/view/cart_screen/widgets/total_continue.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/location_text_and_icon.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: size.width,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LargeText(
                      text: "Cart",
                      fontSize: 30,
                      letterSpacing: -1,
                      fontWeight: FontWeight.normal,
                    ),
                    LocationTextAndIcon(
                      custom: size.width / 3,
                      onPressed: () {},
                      size: size,
                    ),
                  ],
                ),
              ),
            ),
          ),
          CartList(size: size),
          const Spacer(),
          TotalAndContinue(size: size)
        ],
      ),
    );
  }
}
