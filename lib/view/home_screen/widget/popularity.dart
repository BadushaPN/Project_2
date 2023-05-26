import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/home_screen/home_screen.dart';
import 'package:project2/view/home_screen/widget/popularity_and_see_more_button.dart';
import 'package:project2/view/home_screen/widget/popularity_container.dart';

class Popularitys extends StatelessWidget {
  const Popularitys({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.5,
      // color: light,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PopularityTextAndSeeMoreButton(),
          ),
          PopularityContainer(size: size),
        ],
      ),
    );
  }
}
