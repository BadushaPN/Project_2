import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2/model/home_catalog/home_catalog.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';

class PopularityContainer extends StatelessWidget {
  PopularityContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      // width: size.width / 2,
      // color: Colors.black,
      child: StreamBuilder<QuerySnapshot>(
          stream: flower.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            }
            List<dynamic> documentData = snapshot.data!.docs;

            return GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // mainAxisSpacing: 10,
              // crossAxisSpacing: 10,
              physics: const ScrollPhysics(),
              crossAxisCount: 1,
              scrollDirection: Axis.horizontal,
              childAspectRatio: size.width / (size.height / 2),
              shrinkWrap: true,
              children: [
                ...List.generate(
                  documentData.length,
                  (index) => PriorityCard(
                    size: size,
                    popularitys: documentData[index],
                    indeX: index,
                  ),
                )
              ],
            );
          }),
    );
  }
}
