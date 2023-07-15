import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class AddButton extends StatelessWidget {
  IconData icon;
  String text;
  Function() onPress;
  AddButton(
      {super.key,
      required this.size,
      required this.onPress,
      required this.text,
      required this.icon});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: size.width / 9,
        width: size.width / 2.5,
        decoration:
            BoxDecoration(color: dark, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LargeText(
                text: text,
                letterSpacing: -1,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: white,
              ),
              Icon(
                icon,
                color: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
