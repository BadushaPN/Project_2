// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/login_screen/login_screen.dart';
import 'package:project2/view/widgets/back_button.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/my_textformfields.dart';
import 'package:project2/view/widgets/social_media_icon.dart';
import 'package:project2/view/widgets/text_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "SignUp",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextformFields(
                controller: _emailController,
                hintText: "Name",
              ),
              MyTextformFields(
                controller: _emailController,
                hintText: "Email",
              ),
              MyTextformFields(
                controller: _passwordController,
                hintText: "Password",
                padding: 0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen()));
                  // (Route<dynamic> route) => false);
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    " Already have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              TextButtons(
                size: size,
                text: "SignUp",
                onPressed: () {},
                // padding: 10,
              ),
              SizedBox(
                height: size.height / 8,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Or login with social media account",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialMediaIcon(
                          image: const AssetImage("lib/assests/gmail.png"),
                          size: size,
                        ),
                        SocialMediaIcon(
                          image: const AssetImage(
                              "lib/assests/icons8-facebook-48 (1).png"),
                          size: size,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
