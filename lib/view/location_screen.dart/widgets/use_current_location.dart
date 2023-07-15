import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class UseCurrentLocation extends StatelessWidget {
  const UseCurrentLocation({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: size.width / 7.8,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.my_location,
                  color: dark,
                ),
                SizedBox(
                  width: size.width / 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(
                      text: "Use current location",
                      letterSpacing: 0,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    LargeText(
                      text: "Maradu,Ernakulam",
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      color: dark,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
