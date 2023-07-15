import 'package:flutter/material.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';
import 'package:project2/view/widgets/large_text.dart';

class PopularityContainer extends StatelessWidget {
  const PopularityContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      // width: size.width / 2,
      // color: Colors.black,
      child: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 10,
        physics: const ScrollPhysics(),
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        childAspectRatio: size.width / (size.height / 2),
        shrinkWrap: true,
        children: [
          ...List.generate(
            popularitys.length,
            (index) => PriorityCard(
              size: size,
              popularitys: popularitys[index],
              indeX: index,
            ),
          )
        ],
      ),
    );
  }
}
