import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';

class SocialMediaIcon extends StatelessWidget {
  ImageProvider image;
  SocialMediaIcon({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 6,
      height: size.height / 15,
      decoration: BoxDecoration(
        color: white,
        image: DecorationImage(
          image: image,
        ),
      ),
    );
  }
}
