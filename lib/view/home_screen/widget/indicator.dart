import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 22.0 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? dark : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
