// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/search_product.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final textEditingController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchProduct(
                    onChange: (value) {},
                    size: size,
                    textEditingController: textEditingController),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: LargeText(
                      text: "All",
                      letterSpacing: -0.5,
                      fontSize: 20,
                    ),
                  ),
                ),
                GridView.count(
                  physics: const ScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: List.generate(popularitys.length, (index) {
                    return PriorityCard(
                      size: size,
                      popularitys: popularitys[index],
                      custom: size.height / 10,
                      indeX: index,
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
