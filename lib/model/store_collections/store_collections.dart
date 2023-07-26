import 'package:project2/utils/images.dart';

class StoreCollections {
  int id;
  String name;
  String rate;
  bool cart = false;
  bool whishList = false;
  String catalog;
  StoreCollections(this.cart, this.whishList,
      {required this.id,
      required this.name,
      required this.catalog,
      required this.rate});
}

List<StoreCollections> allCollections = [
  StoreCollections(false, false,
      id: 1, name: names[1], catalog: names[1], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[1], catalog: names[2], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[1], catalog: names[3], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[0], catalog: names[4], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[0], catalog: names[5], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[0], catalog: names[6], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[0], catalog: names[7], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[1], catalog: names[8], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[1], catalog: names[9], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[1], catalog: names[10], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[1], catalog: names[11], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[2], catalog: names[12], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[2], catalog: names[13], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[2], catalog: names[14], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[3], catalog: names[15], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[3], catalog: names[16], rate: "80"),
  StoreCollections(false, false,
      id: 1, name: names[3], catalog: names[17], rate: "80"),
  // StoreCollections(false, false,
  //     id: 1, name: names[4], catalog: names[18], rate: "80"),
];
List whishList = [];
List addrressList = [];
List cartList = [];
