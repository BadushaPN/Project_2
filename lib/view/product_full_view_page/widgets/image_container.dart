import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';

class ImageContainer extends StatelessWidget {
  String image;
  ImageContainer({super.key, required this.size, required this.image});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: AssetImage("lib/assests/catalogs/bouquet.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
