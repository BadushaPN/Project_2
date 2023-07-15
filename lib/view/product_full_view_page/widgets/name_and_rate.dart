import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class NameAndRate extends StatelessWidget {
  const NameAndRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LargeText(
          text: "BOUQUET",
          fontSize: 30,
          letterSpacing: -1,
        ),
        LargeText(
          text: "90₹",
          fontSize: 30,
          letterSpacing: -1,
          color: dark,
        ),
      ],
    );
  }
}
