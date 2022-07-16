import 'package:cloud_firestore/cloud_firestore.dart';

class Resrvation {
  String? id;
  String? uid;
  String? name;
  String? type;
  int? number;
  int? days;
  int? price;
  int? constPrice;
  DateTime? date;
  DateTime? last;

  Resrvation(
      {this.id,
      required this.type,
      required this.name,
      required this.number,
      required this.uid,
      required this.date,
      required this.days,
      required this.last,
      required this.price,
      required this.constPrice});

  Resrvation.fromMap(DocumentSnapshot data) {
    id = data.id;
    type = data["type"];
    name = data["name"];
    number = data["number"];
    price = data["price"];
    uid = data["uid"];
    date = data["date"].toDate();
    days = data["days"];
    last = data["last"].toDate();
    constPrice = data["constPrice"];
  }
}
