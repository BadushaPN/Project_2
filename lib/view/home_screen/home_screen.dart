import 'package:flutter/material.dart';
import 'package:project2/model/home_catalog/home_catalog.dart';
import 'package:project2/model/offer_banner/offer_banner.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/home_screen/widget/home_catalogs.dart';
import 'package:project2/view/home_screen/widget/indicator.dart';
import 'package:project2/view/home_screen/widget/popularity.dart';
// import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/location_text_and_icon.dart';
import 'package:project2/view/widgets/search_icon.dart';
import 'package:project2/view/widgets/text_buttons.dart';

import 'widget/offer_items.dart';
import 'widget/profile_home_screen.dart';
import 'widget/profile_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int _isSelected = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 28,
              ),
              LargeText(text: "FlowerBae"),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: size.width / 18,
                              ),
                              const ProfileHomeScreen(),
                              SizedBox(
                                width: size.width / 34,
                              ),
                              const ProfileName(),
                              SizedBox(
                                width: size.width / 2.6,
                              ),
                              SearchIcon(
                                onPressed: () {},
                              )
                            ],
                          ),
                          LocationTextAndIcon(
                            size: size,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                  offerBanner(size, _isSelected),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: size.width,
                      height: 100,
                      // color: dark,
                      child: GridView.count(
                        // padding: const EdgeInsets.symmetric(horizontal: 20),
                        // mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        // physics: const ScrollPhysics(),
                        crossAxisCount: catalogs.length,
                        // scrollDirection: Axis.horizontal,
                        childAspectRatio: size.width / (size.height * 2),
                        // shrinkWrap: true,
                        children: [
                          ...List.generate(
                            catalogs.length,
                            (index) => HomeCatalogs(
                                size: size, catalog: catalogs[index]),
                          )
                        ],
                      ),
                    ),
                  ),
                  Popularitys(
                    size: size,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column offerBanner(Size size, int _isSelected) {
    return Column(
      children: [
        SizedBox(
          height: size.height / 5,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _isSelected = index;
              });
            },
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (context, index) {
              var banner = offersList[index];
              var scale = _isSelected == index ? 1.0 : 0.8;
              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 100),
                tween: Tween(begin: scale, end: scale),
                curve: Curves.ease,
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: OfferItems(
                  offerList: banner,
                ),
              );
            },
            itemCount: offersList.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                offersList.length,
                (index) =>
                    Indicator(isActive: _isSelected == index ? true : false))
            // Indicator(),
          ],
        )
      ],
    );
  }
}
