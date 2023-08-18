import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/cart_screen/cart_screen.dart';
import 'package:project2/view/catalog_screen/catalog_screen.dart';
import 'package:project2/view/home_screen/home_screen.dart';
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
}
