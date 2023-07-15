import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';

class PaymentOptions extends StatelessWidget {
  Function() onTap;
  String text;
  Color color;
  PaymentOptions(
      {super.key,
      required this.size,
      required this.color,
      required this.onTap,
      required this.text});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.width / 6,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.fiber_manual_record,
                  color: color,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
