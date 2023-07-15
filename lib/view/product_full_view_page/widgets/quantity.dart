import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class Quantity extends StatelessWidget {
  const Quantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LargeText(
          text: "QUANTITY",
          fontSize: 20,
          letterSpacing: 0,
          fontWeight: FontWeight.normal,
          color: dark,
        ),
        Container(
          width: 140,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LargeText(
                  text: "-",
                  letterSpacing: 0,
                  fontSize: 20,
                ),
                LargeText(
                  text: "2",
                  fontSize: 20,
                ),
                LargeText(
                  text: "+",
                  letterSpacing: 0,
                  fontSize: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
