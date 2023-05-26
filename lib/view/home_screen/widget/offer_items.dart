import 'package:flutter/material.dart';
import 'package:project2/model/offer_banner/offer_banner.dart';
import 'package:project2/utils/color.dart';

class OfferItems extends StatelessWidget {
  final Offers offerList;
  const OfferItems({
    required this.offerList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(offerList.thumbnailUrl), fit: BoxFit.cover)),
      child: DefaultTextStyle(
          style: TextStyle(color: iconColor),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "title".toLowerCase(),
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        offerList.title.toUpperCase(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
