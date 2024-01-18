import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  File? img;
  void saveAddress() {
    String name = nameController.text;
    String mobileNumber = numberController.text;
    String address = addressController.text;
    // Capture the selected image path or URL
    String? photoUrl = img?.path;

    // Create a map for the address details
    Map<String, dynamic> addressDetails = {
      'name': name,
      'mobileNumber': mobileNumber,
      'photoUrl': photoUrl,
      'address': address,
    };

    // Assuming you have an 'addressList' variable
    addrressList.add(addressDetails); // Add the address details to the list

    // Call the function to save to Firestore
    createNewDocumentWithCustomID();
  }

  Future<void> capturePhoto() async {
    final picker = ImagePicker();
    // ignore: deprecated_member_use
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        img = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width / 3,
              ),
              GestureDetector(
                onTap: () {
                  capturePhoto();
                },
                child: SizedBox(
                  height: size.width / 2,
                  width: size.width,
                  child: img != null
                      ? Image.file(
                          img!,
                          height: double.infinity,
                          width: double.infinity,
                        )
                      : SizedBox(
                          height: size.width / 4,
                          child: ClipRRect(
                            child: Image.asset("lib/assests/user.png"),
                          ),
                        ),
                ),
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
              MyTextformFields(
                controller: nameController,
                hintText: "Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
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
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  // color: Colors.white,
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(fontSize: 20)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile number is required';
                          }
                          return null;
                        },
                      ),
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
                controller: addressController,
                hintText: "Address",
                line: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  size: size,
                  text: "Save",
                  onTap: () {
                    // if (_formKey.currentState.validate()) {
                    // Validation successful, proceed with saving
                    saveAddress();
                    Navigator.pop(context);
                    // }
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
