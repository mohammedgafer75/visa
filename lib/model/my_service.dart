import 'package:cloud_firestore/cloud_firestore.dart';

class MyServices {
  String? id;
  String? uid;
  String? name;
  int? roomNo;
  int? price;

  MyServices(
      {this.id,
      required this.name,
      required this.roomNo,
      required this.price,
      required this.uid});

  MyServices.fromMap(DocumentSnapshot data) {
    id = data.id;
    uid = data["uid"];
    name = data["name"];
    roomNo = data["roomNo"];
    price = data["price"];
  }
}
