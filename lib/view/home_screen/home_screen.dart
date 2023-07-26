import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2/model/home_catalog/home_catalog.dart';
import 'package:project2/view/home_screen/widget/home_catalogs.dart';
import 'package:project2/view/home_screen/widget/my_carousiler.dart';
import 'package:project2/view/home_screen/widget/popularity.dart';
import 'package:project2/view/location_screen.dart/location_screen.dart';
import 'package:project2/view/profile_screen/profile_screen.dart';
// import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/location_text_and_icon.dart';
import 'package:project2/view/widgets/search_icon.dart';

import 'widget/profile_home_screen.dart';
import 'widget/profile_name.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference flower =
      FirebaseFirestore.instance.collection("Flowers");
  @override
  Widget build(BuildContext context) {
    // int _isSelected = 0;
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
                              ProfileHomeScreen(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen())),
                              ),
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
                            onPressed: () {
                              // checkFirebaseConnection();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LocationSelectionPage()),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  // offerBanner(size, _isSelected),
                  MyCarousel(),
                  SizedBox(
                      width: size.width,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: catalogs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
                              width: 55,
                              height: 100,
                              child: HomeCatalogs(
                                size: size,
                                catalog: catalogs[index],
                              ),
                            ),
                          );
                        },
                      )),
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

//   Column offerBanner(Size size, int isSelected) {
//     return Column(
//       children: [
//         SizedBox(
//           height: size.height / 5,
//           child: PageView.builder(
//             onPageChanged: (index) {
//               setState(() {
//                 isSelected = index;
//               });
//             },
//             controller: PageController(viewportFraction: 0.8),
//             itemBuilder: (context, index) {
//               var banner = offersList[index];
//               var scale = isSelected == index ? 1.0 : 0.8;
//               return TweenAnimationBuilder(
//                 duration: const Duration(milliseconds: 100),
//                 tween: Tween(begin: scale, end: scale),
//                 curve: Curves.ease,
//                 builder: (BuildContext context, double value, Widget? child) {
//                   return Transform.scale(
//                     scale: value,
//                     child: child,
//                   );
//                 },
//                 child: OfferItems(
//                   offerList: banner,
//                 ),
//               );
//             },
//             itemCount: offersList.length,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ...List.generate(
//                 offersList.length,
//                 (index) =>
//                     Indicator(isActive: isSelected == index ? true : false))
//             // Indicator(),
//           ],
//         )
//       ],
//     );
}
// }
