import 'package:flutter/material.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';
import 'package:project2/view/widgets/large_text.dart';

class WhishListScreen extends StatelessWidget {
  const WhishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Popularity> data = [];
    int ind = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: size.height / 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LargeText(
                text: "Whishlist",
                fontSize: 30,
                letterSpacing: -1,
                fontWeight: FontWeight.normal,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
              ),
            )
          ],
        ),
        SingleChildScrollView(
            child: SizedBox(
          height: size.height / 1.35,
          child: SingleChildScrollView(
            child: Column(children: [
              GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                physics: const ScrollPhysics(),
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: List.generate(
                  popularitys.length,
                  (index) {
                    if (popularitys[index].isSelected == true) {
                      return PriorityCard(
                        size: size,
                        popularitys: popularitys[index],
                        custom: size.height / 3.5,
                        indeX: index,
                      );
                    }
                    return Center(
                      child: LargeText(text: ""),
                    );
                  },
                ),
              )
            ]),
          ),
        ))
      ]),
    ));
  }
}
