import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class SingleOrderDetails extends StatelessWidget {
  Function()? onTap;
  Color? color;
  String img;
  String name;
  String price;
  String quantity;
  String stockCheck;
  String total;
  String deliverdDate;
  SingleOrderDetails({
    super.key,
    required this.size,
    required this.deliverdDate,
    required this.img,
    required this.name,
    required this.price,
    required this.quantity,
    required this.stockCheck,
    required this.total,
    this.color,
    this.onTap,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.width / 3,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Card(
                  color: Colors.amber,
                  child: Image.asset(img),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      LargeText(
                        text: name,
                        fontSize: 30,
                        letterSpacing: -1,
                        color: dark,
                      ),
                      LargeText(
                        text: price,
                        fontSize: 15,
                        letterSpacing: -1,
                        fontWeight: FontWeight.normal,
                      ),
                      LargeText(
                        text: quantity,
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                      ),
                      LargeText(
                        text: color == null ? stockCheck : "In stock",
                        fontSize: 20,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.normal,
                        color: color ?? Colors.redAccent,
                      ),
                      LargeText(
                        text: total,
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                      LargeText(
                        text: deliverdDate,
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        color: light,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
