import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class PopularityTextAndSeeMoreButton extends StatelessWidget {
  const PopularityTextAndSeeMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LargeText(
          text: "Popularity",
          fontSize: 20,
          letterSpacing: -0.5,
          fontWeight: FontWeight.bold,
        ),
        TextButton(
            onPressed: () {},
            child: LargeText(
              text: "See more >",
              color: dark,
              fontSize: 15,
              letterSpacing: -1,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
