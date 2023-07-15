import 'package:flutter/material.dart';
import 'package:project2/view/widgets/catalog_list.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/search_icon.dart';

class HeadBar extends StatelessWidget {
  Function() onPress;
  HeadBar({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LargeText(
                text: "Ctalog",
                fontSize: 30,
                letterSpacing: -1,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: onPress,
                icon: const Icon(
                  Icons.filter_list,
                )),
            // SearchIcon(onPressed: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const CatalogList()));
            // }),
          ],
        )
      ],
    );
  }
}
