import 'package:flutter/material.dart';
import 'package:project2/model/popularity/popularity.dart';
import 'package:project2/utils/color.dart';
import 'package:project2/view/widgets/large_text.dart';

class PriorityCard extends StatefulWidget {
  double? custom;
  var popularitys;
  PriorityCard(
      {super.key, required this.size, required this.popularitys, this.custom});

  final Size size;

  @override
  State<PriorityCard> createState() => _PriorityCardState();
}

class _PriorityCardState extends State<PriorityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: widget.custom ?? widget.size.width / 3,
              // width: size.width / 1.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.popularitys.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LargeText(
                      text: widget.popularitys.title.toUpperCase(),
                      fontSize: 15,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                      color: light,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Icon(
                        Icons.heart_broken,
                        color: widget.popularitys.isSelected == true
                            ? Colors.red
                            : light,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LargeText(
                      text: widget.popularitys.rate,
                      fontSize: 15,
                      letterSpacing: 0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.heart_broken,
                        color: widget.popularitys.isSelected == true
                            ? Colors.red
                            : light,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
