import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/home_screen/home_screen.dart';
import 'package:project2/view/login_screen/login_screen.dart';
import 'package:project2/view/splash_screen.dart';

import 'view/signup_screen/signup_screen.dart';
import 'view/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light(primary: myTheme),
          scaffoldBackgroundColor: myTheme),
      title: "FlowerBea",
      debugShowCheckedModeBanner: false,
      home: BottomNavigatoionBar(),
    );
  }
}
