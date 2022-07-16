import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/model/bills.dart';
import 'package:visa/model/my_service.dart';
import 'package:visa/model/resrvation_model.dart';
import 'package:visa/widgets/loading.dart';
import 'package:visa/widgets/snackbar.dart';

class AllData extends GetxController {
  RxList<Resrvation> resrvations = RxList<Resrvation>([]);
  RxList<MyServices> myServices = RxList<MyServices>([]);
  RxList<MyBills> myBills = RxList<MyBills>([]);
  late CollectionReference collectionReference;
  late CollectionReference collectionReference2;
  late CollectionReference collectionReference3;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  auth.User? user;
  @override
  void onInit() {
    user = FirebaseAuth.instance.currentUser;
    collectionReference = firebaseFirestore.collection("resrvation");
    collectionReference2 = firebaseFirestore.collection("myservice");
    collectionReference3 = firebaseFirestore.collection("mybills");
    resrvations.bindStream(getAllRooms());
    myServices.bindStream(getAllServices());
    myBills.bindStream(getAllBills());
    super.onInit();
  }

  Stream<List<Resrvation>> getAllRooms() => collectionReference
      .where('uid', isEqualTo: user!.uid)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => Resrvation.fromMap(item)).toList());

  Stream<List<MyServices>> getAllServices() => collectionReference2
      .where('uid', isEqualTo: user!.uid)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => MyServices.fromMap(item)).toList());

  Stream<List<MyBills>> getAllBills() => collectionReference3
      .where('uid', isEqualTo: user!.uid)
      .snapshots()
      .map((query) => query.docs.map((item) => MyBills.fromMap(item)).toList());
  deleteService(String id, int number, int price) async {
    var res = await firebaseFirestore
        .collection('mybills')
        .where('roomNo', isEqualTo: number)
        .where('uid', isEqualTo: user!.uid)
        .get();
    Get.dialog(AlertDialog(
      content: const Text('are you sure'),
      actions: [
        TextButton(
            onPressed: () async {
              showdilog();
              try {
                await collectionReference2.doc(id).delete();
                await firebaseFirestore
                    .collection('mybills')
                    .doc(res.docs[0].id)
                    .update({
                  "servicesCount": res.docs[0]["servicesCount"] - 1,
                  "ServicesPrice": res.docs[0]["ServicesPrice"] - price,
                });
                update();
                Get.back();
                Get.back();
                showbar('delete', 'delete', 'service deleted', true);
              } catch (e) {
                Get.back();
                Get.snackbar('error', e.toString(),
                    backgroundColor: Colors.red);
              }
            },
            child: const Text('yes')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('back'))
      ],
    ));
  }

  deleteResrvation(String id, int number) async {
    var res = await firebaseFirestore
        .collection('mybills')
        .where('roomNo', isEqualTo: number)
        .where('uid', isEqualTo: user!.uid)
        .get();
    Get.dialog(AlertDialog(
      content: const Text('are you sure'),
      actions: [
        TextButton(
            onPressed: () async {
              showdilog();
              try {
                await collectionReference.doc(id).delete();
                await firebaseFirestore
                    .collection('mybills')
                    .doc(res.docs[0].id)
                    .delete();
                update();
                Get.back();
                Get.back();
                showbar('delete', 'delete', 'Resrvation deleted', true);
              } catch (e) {
                Get.back();
                Get.snackbar('error', e.toString(),
                    backgroundColor: Colors.red);
              }
            },
            child: const Text('yes')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('back'))
      ],
    ));
  }

  late DateTime time;
  // void getDatetime(BuildContext context) {
  //   BottomPicker.dateTime(
  //     title: "choose time",
  //     titleStyle: const TextStyle(
  //         fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
  //     onSubmit: (date) {
  //       time = date;
  //       update();
  //     },
  //     onClose: () {},
  //     buttonText: 'Confirm',
  //     buttonTextStyle: const TextStyle(color: Colors.white),
  //     buttonSingleColor: Colors.pink,
  //     minDateTime: DateTime.now(),
  //   ).show(context);
  // }

  TextEditingController day = TextEditingController();
  TextEditingController price = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  editResrvation(int number, String id, int constPrice) async {
    if (formKey.currentState!.validate()) {
      showdilog();
      var res = await firebaseFirestore
          .collection('mybills')
          .where('roomNo', isEqualTo: number)
          .where('uid', isEqualTo: user!.uid)
          .get();
      try {
        await collectionReference.doc(id).update({
          "days": int.tryParse(day.text.toString()),
          "price": constPrice * int.tryParse(day.text.toString())!,
          "date": time,
          "last": time.add(Duration(days: int.tryParse(day.text.toString())!))
        });
        await firebaseFirestore
            .collection('mybills')
            .doc(res.docs[0].id)
            .update({
          "days": int.tryParse(day.text.toString()),
          "resrvationPrice": constPrice * int.tryParse(day.text.toString())!,
          "time": time,
          "last": time.add(Duration(days: int.tryParse(day.text.toString())!))
        });
        update();
        Get.back();
        showbar('Edit', 'delete', 'Resrvation Edited', true);
      } catch (e) {
        Get.back();
        Get.snackbar('error', e.toString(), backgroundColor: Colors.red);
      }
    }
  }
}
