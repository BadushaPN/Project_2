// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/cart_screen/widgets/total_continue.dart';
import 'package:project2/view/payment_success_screen/payment_success_screen.dart';
import 'package:project2/view/whishlist_screen/whishlist_screen.dart';
import 'package:project2/view/widgets/large_text.dart';

import 'widgets/payment_options.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: LargeText(
                text: "Payment options",
                letterSpacing: -1,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: size.width / 15,
            ),
            PaymentOptions(
              size: size,
              color: dark,
              onTap: () {},
              text: 'UPI',
            ),
            PaymentOptions(
              size: size,
              color: light,
              onTap: () {},
              text: 'Credit Card/Debit card',
            ),
            PaymentOptions(
              size: size,
              color: light,
              onTap: () {},
              text: 'Net banking',
            ),
            PaymentOptions(
              size: size,
              color: light,
              onTap: () {},
              text: 'Cash on delivery',
            ),
            const Spacer(),
            TotalAndContinue(
                size: size,
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentSuccessScreen()));
                })
          ],
        ),
      )),
    );
  }
}
