import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: size.width / 7.8,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: dark,
              ),
              SizedBox(
                width: size.width / 14,
              ),
              LargeText(
                text: "Add location",
                letterSpacing: 0,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
