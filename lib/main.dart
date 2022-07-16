import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/booking_page.dart';
import 'package:visa/controller/auth_controller.dart';
import 'package:visa/controller/home_controller.dart';
import 'package:visa/home_page.dart';
import 'package:visa/hotel_details_page.dart';
import 'package:visa/login_page.dart';
import 'package:visa/main_page.dart';
import 'profile_page.dart';
import 'sign_up_page.dart';


Future<void> main() async {

   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final AuthController controller = Get.put(AuthController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.cyan,
        primarySwatch: Colors.cyan,
      ),
      home: controller.route,
    );
  }
}

