import 'package:flutter/material.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';
import 'package:project2/view/widgets/large_text.dart';

class CartList extends StatelessWidget {
  const CartList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        height: size.height / 5,
        color: light,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: size.width / 2,
                child: Expanded(
                  child: PriorityCard(
                    popularitys: popularitys[0],
                    size: size,
                    custom: size.height / 12,
                  ),
                ),
              ),
              Container(
                width: 140,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LargeText(
                        text: "+",
                        letterSpacing: 0,
                        fontSize: 20,
                      ),
                      LargeText(
                        text: "1",
                        fontSize: 20,
                      ),
                      LargeText(
                        text: "-",
                        letterSpacing: 0,
                        fontSize: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
