import 'package:flutter/material.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/product_full_view_page/product_full_view_page.dart';
import 'package:project2/view/widgets/back_button.dart';
import 'package:project2/view/widgets/large_text.dart';
import 'package:project2/view/widgets/location_text_and_icon.dart';

import 'widgets/single_order_details.dart';

class YourOrders extends StatefulWidget {
  const YourOrders({super.key});

  @override
  State<YourOrders> createState() => _YourOrdersState();
}

FocusNode _focusNode = FocusNode();

class _YourOrdersState extends State<YourOrders> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyBackButton(onpressed: () {
                Navigator.pop(context);
              }),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Your Orders",
                  fontSize: 30,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TextField(
                    focusNode: _focusNode,
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SingleOrderDetails(
                  onTap: () {},
                  size: size,
                  img: "lib/assests/all_collections/accs4.webp",
                  name: "Mask",
                  price: "Price:350₹",
                  quantity: "Quantity:2",
                  stockCheck: "Out of stock",
                  total: "Total:700₹",
                  deliverdDate: "Deliverd 26 april 2023"),
              SingleOrderDetails(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductFullViewPage(data: popularitys[0])));
                },
                size: size,
                img: "lib/assests/catalogs/bouquet.jpg",
                name: "Bouquet",
                price: "Price:90₹",
                quantity: "Quantity:2",
                stockCheck: "Out of stock",
                total: "Total:180₹",
                deliverdDate: "Deliverd 20 april 2023",
                color: Colors.green,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
