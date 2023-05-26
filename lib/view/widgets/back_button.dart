import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';

class MyBackButton extends StatelessWidget {
  Function() onpressed;
  MyBackButton({
    required this.onpressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "<",
          style: TextStyle(
              fontSize: 40, color: iconColor, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
