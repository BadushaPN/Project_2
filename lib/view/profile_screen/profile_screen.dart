import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/login_screen%20copy/login_screen.dart';
import 'package:project2/view/profile_screen/widgets/profile_list.dart';
import 'package:project2/view/user_details_screen/user_details_screen.dart';
import 'package:project2/view/widgets/back_button.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/your_orders_screen/your_orders_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 15,
            ),
            MyBackButton(
              onpressed: () {
                Navigator.pop(context);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LargeText(
                  text: "User Name",
                  fontSize: 30,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w400,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("lib/assests/user.png"),
                ),
              ],
            ),
            SizedBox(
              height: size.width / 15,
            ),
            ProfileLists(
              size: size,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => YourOrders()));
              },
              text: 'Your oders',
            ),
            ProfileLists(
              size: size,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfileScreen()));
              },
              text: 'Account',
            ),
            ProfileLists(
              size: size,
              onTap: () {},
              text: 'Privacy and policy',
            ),
            ProfileLists(
              size: size,
              onTap: () {
                auth.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              text: 'Logout',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: LargeText(
                text: "FlowerBae",
                color: dark,
              ),
            )
          ],
        ),
      )),
    );
  }
}
