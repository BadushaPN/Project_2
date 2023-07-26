import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/view/login_screen%20copy/login_screen.dart';
import 'package:project2/view/widgets/large_text.dart';

import '../../../utils/color.dart';
import '../../widgets/bottom_navigation_bar.dart';
import '../../widgets/text_buttons.dart';

class OTPPage extends StatefulWidget {
  // final String verificationId;

  const OTPPage();

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController _otpController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String smsCode = "";
  void _verifyOTP() {
    // String smsCode = _otpController.text.trim();
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //   verificationId: widget.verificationId,
    //   smsCode: smsCode,
    // );
    // _signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                padding: const EdgeInsets.all(8.0),
                child: LargeText(
                  text: "Enter your verification OTP",
                  fontSize: 20,
                  letterSpacing: -0.5,
                  color: dark,
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
                      child: TextFormField(
                        onChanged: (value) {
                          smsCode = value;
                        },
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Enter OTP",
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        // maxLength: 4,
                        // maxLines: 4,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
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
                    // createNewDocumentWithCustomID();
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigatoionBar()),
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
