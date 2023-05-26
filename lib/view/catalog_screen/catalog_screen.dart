import 'package:flutter/material.dart';
import 'package:project2/model/home_catalog/home_catalog.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/model/store_collections/store_collections.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/catalog_screen/widgets/head_bar.dart';
import 'package:project2/view/home_screen/widget/home_catalogs.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';
import 'package:project2/view/widgets/back_button.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/search_icon.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 15,
          ),
          const HeadBar(),
          SingleChildScrollView(
              child: SizedBox(
            height: size.height / 1.35,
            child: SingleChildScrollView(
              child: Column(children: [
                GridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      custom: size.height / 12,
                    );
                  }),
                )
              ]),
            ),
          ))
        ],
      ),
    );
  }
}
