import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class TotalRate extends StatelessWidget {
  const TotalRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LargeText(
          text: "TOTAL",
          fontSize: 20,
          letterSpacing: -1,
        ),
        LargeText(
          text: "180₹",
          fontSize: 20,
          letterSpacing: -1,
          color: dark,
        ),
      ],
    );
  }
}
