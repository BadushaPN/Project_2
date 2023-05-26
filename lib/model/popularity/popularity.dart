import 'package:flutter/material.dart';

class Popularity {
  int id;
  String title;
  String image;
  Color color;
  String rate;
  bool isSelected = false;
  Popularity(
    this.isSelected,
    this.id,
    this.image,
    this.title, {
    required this.rate,
    required this.color,
  });
}

List<Popularity> popularitys = [
  Popularity(
    true,
    1,
    "lib/assests/catalogs/bouquet.jpg",
    "BOUQUET",
    color: Colors.yellow,
    rate: '90₹',
  ),
  Popularity(false, 2, "lib/assests/catalogs/table.jpg", "TABLE",
      color: Colors.blue, rate: '100₹'),
  Popularity(false, 3, "lib/assests/catalogs/aisle.webp", "AISLE",
      color: Colors.red, rate: '190₹'),
  Popularity(false, 4, "lib/assests/catalogs/accessories.jpeg", "ACCESSORIES",
      color: Colors.green, rate: '350₹'),
];
