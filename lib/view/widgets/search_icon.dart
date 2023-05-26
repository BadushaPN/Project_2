import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  Function() onPressed;
  SearchIcon({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.search,
        ));
  }
}
