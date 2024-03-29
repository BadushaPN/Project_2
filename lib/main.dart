import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SplashScreen(),
    );
  }
}
