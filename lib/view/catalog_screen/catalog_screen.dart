import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project2/view/catalog_screen/widgets/filterchips.dart';
import 'package:project2/view/catalog_screen/widgets/head_bar.dart';
import 'package:project2/view/home_screen/widget/popularity_card.dart';

class CatalogScreen extends StatefulWidget {
  CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final CollectionReference flower =
      FirebaseFirestore.instance.collection("Flowers");
  String searchQuery = '';
  TextEditingController textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

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
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            children: [
              SizedBox(
                height: size.height / 15,
              ),
              HeadBar(
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FilterDialog()));
                },
              ),
              SizedBox(
                height: size.height / 1.35,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            searchQuery = val;
                          });
                        },
                        focusNode: _focusNode,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: flower.snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        List<dynamic> documentData = snapshot.data!.docs;
                        // final filteredData = snapshot.data!.docs.where((doc) {
                        //   final productName =
                        //       doc['name'].toString().toLowerCase();
                        //   return productName
                        //       .contains(searchQuery.toLowerCase());
                        // }).toList();
                        return GridView.count(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          physics: const ScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: List.generate(documentData.length, (index) {
                            return PriorityCard(
                              size: size,
                              popularitys: documentData[index],
                              custom: size.height / 12,
                              indeX: index,
                            );
                          }),
                        );
                      })
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
