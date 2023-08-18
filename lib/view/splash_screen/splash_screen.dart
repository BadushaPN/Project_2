import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/login_screen%20copy/login_screen.dart';
import 'package:project2/view/widgets/bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool _isLoggedIn = false;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset('lib/assests/55517-yoga-lotus-flower.json'),
        backgroundColor: dark,
        duration: 3200,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 250,
        nextScreen: _isLoggedIn ? BottomNavigatoionBar() : LoginPage());
  }

  Future<void> _checkLoginStatus() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    // });
    // await login();
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          _isLoggedIn = true;
        });
      }
    });
  }

  Future<void> login() async {
    if (_isLoggedIn == false) {
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (ctx1) {
        return BottomNavigatoionBar();
      }));
    } else {
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (cotx1) {
        return LoginPage();
      }));
    }
  }
}
