import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class MyBills {
  String? id;
  String? name;
  String? uid;
  int? roomNo;
  int? days;
  int? resrvationPrice;
  int? constPrice;
  int? servicesCount;
  int? ServicesPrice;
  DateTime? time;
  DateTime? last;

  MyBills(
      {this.id,
      required this.uid,
      required this.roomNo,
      required this.name,
      required this.days,
      required this.resrvationPrice,
      required this.servicesCount,
      required this.time,
      required this.last,
      required this.constPrice,
      // ignore: non_constant_identifier_names
      required this.ServicesPrice});

  MyBills.fromMap(DocumentSnapshot data) {
    id = data.id;
    uid = data["uid"];
    name = data["name"];
    days = data["days"];
    resrvationPrice = data["resrvationPrice"];
    servicesCount = data["servicesCount"];
    time = data["time"].toDate();
    last = data["last"].toDate();
    roomNo = data["roomNo"];
    constPrice = data["constPrice"];
    ServicesPrice = data["ServicesPrice"];
  }
}
