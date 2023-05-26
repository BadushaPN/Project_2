import 'package:flutter/material.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage("lib/assests/user.png"),
    );
  }
}
