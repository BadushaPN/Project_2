import 'package:flutter/material.dart';
import 'package:project2/model/home_catalog/home_catalog.dart';
import 'package:project2/view/widgets/large_text.dart';

class HomeCatalogs extends StatelessWidget {
  var catalog;
  HomeCatalogs({super.key, required this.size, required this.catalog});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            height: 60,
            // width: 200,
            // color: catalogs[index].color,
            decoration: BoxDecoration(
              color: catalog.color,
              image: DecorationImage(
                  image: AssetImage(catalog.image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: size.height / 300,
          ),
          LargeText(
            text: catalog.title.toUpperCase(),
            fontSize: 10,
            letterSpacing: 0,
          )
        ],
      ),
    );
  }
}
