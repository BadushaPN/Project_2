import 'package:flutter/material.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/product_full_view_page/product_full_view_page.dart';
import 'package:project2/view/widgets/large_text.dart';

class PriorityCard extends StatefulWidget {
  int indeX;
  double? custom;
  var popularitys;
  PriorityCard(
      {super.key,
      required this.size,
      required this.popularitys,
      this.custom,
      required this.indeX});

  final Size size;

  @override
  State<PriorityCard> createState() => _PriorityCardState();
}

class _PriorityCardState extends State<PriorityCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductFullViewPage(data: widget.popularitys)));
      },
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: widget.custom ?? widget.size.width / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.popularitys['image']),
                        // image: AssetImage(
                        //     'lib/assests/Screenshot 2023-06-16 212447.png'),
                        fit: BoxFit.cover),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeText(
                        text: widget.popularitys['name'].toUpperCase(),
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                        color: light,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite,
                          color:
                              // widget.popularitys.isSelected == true
                              //     ? Colors.redAccent
                              //     : .
                              light,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeText(
                        text: widget.popularitys['product price'] + '₹',
                        fontSize: 15,
                        letterSpacing: 0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart,
                          color:
                              //  widget.popularitys.isSelected == true
                              //     ? dark
                              //     :.
                              light,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
