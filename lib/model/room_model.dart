import 'package:cloud_firestore/cloud_firestore.dart';

class Rooms {
  String? id;
  String? image;
  String? description;
  int? price;
  int? number;

  Rooms({
    this.id,
    required this.price,
    required this.number,
    required this.image,
    required this.description
  });

  Rooms.fromMap(DocumentSnapshot data) {
    id = data.id;
    price = data["price"];
    number = data["number"];
    image = data["image"];
    description = data["description"];
  }
}
