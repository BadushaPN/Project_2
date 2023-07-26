import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project2/model/store_collections/store_collections.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/cart_screen/cart_screen.dart';
import 'package:project2/view/catalog_screen/catalog_screen.dart';
import 'package:project2/view/home_screen/home_screen.dart';
import 'package:project2/view/login_screen%20copy/login_screen.dart';
import 'package:project2/view/whishlist_screen/whishlist_screen.dart';

class BottomNavigatoionBar extends StatefulWidget {
  const BottomNavigatoionBar({super.key});

  @override
  State<BottomNavigatoionBar> createState() => _BottomNavigatoionBarState();
}

class _BottomNavigatoionBarState extends State<BottomNavigatoionBar> {
  @override
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    CatalogScreen(),
    WhishListScreen(),
    CartScreen(),
  ];
  @override
  void initState() {
    createNewDocumentWithCustomID();
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
              color: dark, borderRadius: BorderRadius.circular(60)),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            tabs: [
              GButton(
                icon: Icons.home,
                iconColor: light,
                text: 'Home',
              ),
              GButton(
                icon: Icons.category_rounded,
                text: 'Catalog',
                iconColor: light,
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Whishlist',
                iconColor: light,
              ),
              GButton(
                icon: Icons.shopping_cart,
                text: 'Cart',
                iconColor: light,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createNewDocumentWithCustomID() async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the collection where you want to create the document
      CollectionReference collectionRef = firestore.collection('users');

      // Specify a custom document ID (e.g., 'user123')
      String customDocumentId = phone;

      // Check if the document with the custom ID already exists
      DocumentSnapshot documentSnapshot =
          await collectionRef.doc(customDocumentId).get();

      if (documentSnapshot.exists) {
        // The document already exists, do not create a new one
        print('Document with ID $customDocumentId already exists.');
        return;
      } else {
        // The document does not exist, create a new one
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
}
