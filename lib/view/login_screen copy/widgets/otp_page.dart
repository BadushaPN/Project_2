import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:project2/view/login_screen%20copy/login_screen.dart';
import 'package:project2/view/profile_screen/profile_screen.dart';
import 'package:project2/view/widgets/large_text.dart';

import '../../../utils/color.dart';
import '../../widgets/bottom_navigation_bar.dart';
import '../../widgets/text_buttons.dart';

class OTPPage extends StatefulWidget {
  const OTPPage();

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController _otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String smsCode = "";
  bool userExist = false;
  void getPhoneNumber() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      // The phone number may be stored in the user's metadata
      String? phoneNumber = user.phoneNumber;
      final ref = await FirebaseFirestore.instance
          .collection('users')
          .doc(phoneNumber)
          .get();
      if (ref.exists) {
        setState(() {
          userExist = true;
        });
        print('Phone number: $phoneNumber');
      } else {
        print('Phone number not available');
      }
    } else {
      print('User is not signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(1, 136, 255, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: dark),
      ),
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width / 3,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: LargeText(text: "<"),
                ),
              ),
              Lottie.asset(
                'lib/assests/74569-two-factor-authentication.json', // Replace with your animation asset file path
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: LargeText(
                    text: "Enter your verification OTP",
                    fontSize: 20,
                    letterSpacing: -0.5,
                    color: dark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  // color: Colors.white,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Pinput(
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        defaultPinTheme: defaultPinTheme,
                        showCursor: true,
                        length: 6,
                        onChanged: (val) {
                          smsCode = val;
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: LargeText(
                      text: "Edit Phone Number",
                      fontSize: 15,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ),
              TextButtons(
                padding: 50,
                size: size,
                text: "Verify",
                onPressed: () async {
                  try {
                    // Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: LoginPage.otp, smsCode: smsCode);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    getPhoneNumber();
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => userExist
                                ? BottomNavigatoionBar()
                                : ProfileScreen()),
                        (route) => false);
                  } catch (e) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
