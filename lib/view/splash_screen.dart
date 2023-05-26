import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
// import 'package:project2/view/login_screen/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
// import "package:gif/gif.dart";

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 5),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: Center(
        child: AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: !_visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: Text(
              "FlowerBea",
              style: TextStyle(
                  fontFamily: "SixCaps", fontSize: 80, color: Colors.white),
            )),
      ),
    );
  }
}
