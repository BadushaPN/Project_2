import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class SavedLocations extends StatelessWidget {
  const SavedLocations({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: size.width / 7.8,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.location_city,
                  size: 20,
                ),
                SizedBox(
                  width: size.width / 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(
                      text: "Nettoor",
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                    ),
                    LargeText(
                      text: "Maradu,Ernakulam",
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 10,
                    color: dark,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
