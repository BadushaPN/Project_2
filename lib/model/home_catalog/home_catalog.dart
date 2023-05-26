import 'package:flutter/material.dart';

class HomeCatalog {
  int id;
  String title;
  String image;
  Color color;
  HomeCatalog(this.id, this.image, this.title, {required this.color});
}

List<HomeCatalog> catalogs = [
  HomeCatalog(1, "lib/assests/catalogs/all.png", "ALL", color: Colors.black),
  HomeCatalog(2, "lib/assests/catalogs/bouquet.jpg", "BOUQUET",
      color: Colors.yellow),
  HomeCatalog(3, "lib/assests/catalogs/table.jpg", "TABLE", color: Colors.blue),
  HomeCatalog(4, "lib/assests/catalogs/aisle.webp", "AISLE", color: Colors.red),
  HomeCatalog(5, "lib/assests/catalogs/accessories.jpeg", "ACCESSORIES",
      color: Colors.green),
];
