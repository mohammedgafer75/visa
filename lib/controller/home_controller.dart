// import 'package:bottom_picker/bottom_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/widgets/custom_button.dart';

import '../model/room_model.dart';
import '../model/service_model.dart';
import '../widgets/loading.dart';
import '../widgets/snackbar.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<Rooms> rooms = RxList<Rooms>([]);
  RxList<Service> services = RxList<Service>([]);
  late TextEditingController name, type, price, day, number;
  DateTime time = DateTime.now();
  late CollectionReference collectionReference;
  late CollectionReference collectionReference2;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  auth.User? user;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  @override
  void onInit() {
    user = FirebaseAuth.instance.currentUser;
    collectionReference = firebaseFirestore.collection("room");
    collectionReference2 = firebaseFirestore.collection("resrvation");
    name = TextEditingController();
    price = TextEditingController();
    type = TextEditingController();
    day = TextEditingController();
    number = TextEditingController();
    rooms.bindStream(getAllRooms());
    services.bindStream(getAllService());
    loading.value = true;
    super.onInit();
  }

  Stream<List<Rooms>> getAllRooms() => collectionReference
      .where('check', isEqualTo: false)
      .snapshots()
      .map((query) => query.docs.map((item) => Rooms.fromMap(item)).toList());
  Stream<List<Service>> getAllService() => collectionReference2
      .where('uid', isEqualTo: user!.uid)
      .snapshots()
      .map((query) => query.docs.map((item) => Service.fromMap(item)).toList());

  // void getDatetime(BuildContext context) {
  //   BottomPicker.dateTime(
  //     title: "choose time",
  //     titleStyle: const TextStyle(
  //         fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
  //     onSubmit: (date) {
  //       time = date;
  //       update(['time']);
  //     },
  //     onClose: () {},
  //     buttonText: 'Confirm',
  //     buttonTextStyle: const TextStyle(color: Colors.white),
  //     buttonSingleColor: Colors.pink,
  //     minDateTime: DateTime.now(),
  //   ).show(context);
  // }

  makeService(
      int price, int number, DateTime startdate, enddate, int count) async {
    showdilog();
    var re = <String, dynamic>{
      "uid": user!.uid,
      "price": price,
      "roomNo": number,
      "startDate": startdate,
      "endDate": enddate,
      "roomCount": count
    };
    firebaseFirestore
        .collection("resrvation")
        .doc()
        .set(re)
        .whenComplete(() async {
      Get.back();
      Get.back();
      showbar("resrvation Added", "resrvation Added", "resrvation added", true);
    }).catchError((error) {
      Get.back();
      showbar("Error", "Error", error.toString(), false);
    });
  }
}
