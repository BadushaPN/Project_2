import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:project2/utils/color.dart';

class MyCarousel extends StatelessWidget {
  final List<String> items = [
    'lib/assests/all_collections/aisl2.jpeg',
    'lib/assests/all_collections/aisl3.jpeg',
    // 'lib/assests/all_collections/aisl1.jpeg',
    // 'lib/assests/all_collections/aisl2.jpeg',
    // 'lib/assests/all_collections/aisl3.jpeg',
    // 'lib/assests/all_collections/aisl4.jpeg'
    'lib/assests/all_collections/bq4.webp',
    'lib/assests/all_collections/accs1.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: dark,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SizedBox(
                  child: ClipRect(
                child: Image.asset(
                  items[index],
                  fit: BoxFit.contain,
                ),
              ))),
        );
      },
      options: CarouselOptions(
        height: 200,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
    );
  }
}
