import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class CustomButton extends StatelessWidget {
  Function() onTap;
  String text;
  CustomButton(
      {super.key, required this.size, required this.text, required this.onTap});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: size.width,
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: LargeText(
            text: text,
            color: white,
            letterSpacing: -0.5,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
