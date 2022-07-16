import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String? id;
  int? price;
  int? roomNo;
  int? roomCount;
  DateTime? startDate;
  DateTime? endDate;
  Service({
    this.id,
    required this.price,
    required this.roomCount,
    required this.roomNo,
    required this.startDate,
    required this.endDate,
  });

  Service.fromMap(DocumentSnapshot data) {
    id = data.id;
    price = data["price"];
    roomCount = data["roomCount"];
    roomNo = data["roomNo"];
    startDate = data["startDate"].toDate();
    endDate = data["endDate"].toDate();
  }
}
