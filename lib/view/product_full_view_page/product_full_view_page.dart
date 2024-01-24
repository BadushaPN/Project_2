import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project2/view/product_full_view_page/widgets/add_button.dart';
import 'package:project2/view/product_full_view_page/widgets/quantity.dart';
import 'package:project2/view/widgets/large_text.dart';

import '../widgets/back_button.dart';
import 'widgets/image_container.dart';
import 'widgets/name_and_rate.dart';
import 'widgets/total_rate.dart';

// ignore: must_be_immutable
class ProductFullViewPage extends StatelessWidget {
  var data;
  ProductFullViewPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyBackButton(
                  onpressed: () {
                    Navigator.pop(context);
                  },
                ),
                ImageContainer(
                  size: size,
                  image: data['image'],
                ),
                SizedBox(
                  height: size.width / 18,
                ),
                const NameAndRate(),
                SizedBox(
                  height: size.width / 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LargeText(
                      text: "Availability",
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                    ),
                    LargeText(
                      text: "In stock",
                      fontSize: 20,
                      letterSpacing: -1,
                      color: Colors.green,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width / 18,
                ),
                const Quantity(),
                SizedBox(
                  height: size.width / 18,
                ),
                const TotalRate(),
                SizedBox(
                  height: size.width / 18,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddButton(
                        size: size,
                        onPress: () {
                          Fluttertoast.showToast(
                            msg: "Added to cart",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            textColor: Colors.white,
                            backgroundColor: Colors.black,
                            fontSize: 12,
                          );
                        },
                        text: "Add to whishlist",
                        icon: Icons.favorite,
                      ),
                      AddButton(
                        size: size,
                        onPress: () {
                          Fluttertoast.showToast(
                            msg: "Added to whishlist",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 2,
                            textColor: Colors.white,
                            backgroundColor: Colors.black,
                            fontSize: 12,
                          );
                        },
                        text: "Add to cart",
                        icon: Icons.shopping_cart,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
