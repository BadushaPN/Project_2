import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2/model/store_collections/store_collections.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/custom_button.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/my_textformfields.dart';

import '../login_screen copy/login_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

void createNewDocumentWithCustomID() async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference collectionRef = firestore.collection('users');

    String customDocumentId = phone;

    DocumentSnapshot documentSnapshot =
        await collectionRef.doc(customDocumentId).get();

    if (documentSnapshot.exists) {
      print('Document with ID $customDocumentId already exists.');
      return;
    } else {
      await collectionRef.doc(customDocumentId).set({
        'address': addrressList,
        'whishList': whishList,
        'cart': cartList,
      });

      print('New document with custom ID added to the collection!');
    }
  } catch (e) {
    print('Error creating document: $e');
  }
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController nameController =
      TextEditingController(text: "User Name");
  final TextEditingController numberController = TextEditingController();
  File? img;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width / 3,
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: size.width / 3,
                  child: img != null
                      ? Image.file(
                          img!,
                          height: 50,
                          width: 50,
                        )
                      : SizedBox(
                          height: size.width / 4,
                          child: ClipRRect(
                            child: Image.asset("lib/assests/user.png"),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: size.width / 6,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Name :",
                  letterSpacing: -0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              MyTextformFields(controller: nameController, hintText: "Name"),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Mobile Number :",
                  letterSpacing: -0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  // color: Colors.white,
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(fontSize: 20))),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Address :",
                  letterSpacing: -0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              MyTextformFields(
                controller: nameController,
                hintText: "Address",
                line: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  size: size,
                  text: "Save",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
