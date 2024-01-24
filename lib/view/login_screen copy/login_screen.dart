import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/login_screen%20copy/widgets/otp_page.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/text_buttons.dart';

// String otp = "";
var phone = "";

class LoginPage extends StatefulWidget {
  static String otp = "";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    // _loadSavedCredentials();
  }

  // void _loadSavedCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     // _usernameController.text = prefs.getString('username') ?? '';
  //     _passwordController.text = prefs.getString('password') ?? '';
  //     _rememberMe = prefs.getBool('rememberMe') ?? false;
  //   });
  // }

  // void _saveCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // await prefs.setString('username', _usernameController.text);
  //   await prefs.setString('password', _passwordController.text);
  //   await prefs.setBool('rememberMe', _rememberMe);
  //   // ignore: use_build_context_synchronously
  //   await Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //           builder: (BuildContext context) => BottomNavigatoionBar()),
  //       (Route<dynamic> route) => false);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: size.width / 3,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Login",
                ),
              ),
              Lottie.asset(
                'lib/assests/74569-two-factor-authentication.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              LargeText(
                text: "We need to verify your phone number\n before you start",
                fontSize: 20,
                letterSpacing: -0.5,
                color: dark,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  // color: Colors.white,
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          const Text(
                            "+91",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              onChanged: (value) {
                                phone = value;
                              },
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration.collapsed(
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: size.height / 15,
              // ),
              TextButtons(
                size: size,
                text: "Login",
                onPressed: () {
                  _verifyPhoneNumber();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: LargeText(text: "FlowerBae"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 $phone',
        verificationCompleted: (PhoneAuthCredential credential) {
          // Handle verification completed
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failed
        },
        codeSent: (String verificationId, int? resendToken) {
          LoginPage.otp = verificationId;
          // Handle code sent
          // Navigate to OTPPage passing the verificationId if needed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPPage(),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout
        },
      );
    } catch (e) {
      // Handle any potential exceptions
    }
  }
}
