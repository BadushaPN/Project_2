import 'package:flutter/material.dart';
import 'package:project2/view/widgets/large_text.dart';

class SavedLocationText extends StatelessWidget {
  const SavedLocationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: LargeText(
        text: "Saved Location",
        letterSpacing: -0.5,
        fontSize: 20,
      ),
    );
  }
}
