import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String? id;
  String? uid;
  String? email;
  int? number;

  Users({
    this.id,
    required this.uid,
    required this.number,
    required this.email,
  });

  Users.fromMap(DocumentSnapshot data) {
    id = data.id;
    uid = data["uid"];
    number = data["number"];
    email = data["email"];
  }
}
