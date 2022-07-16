import 'dart:io';
import 'package:search_page/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/booking_page.dart';
import 'package:visa/controller/home_controller.dart';
import 'package:visa/hotel_details_page.dart';
import 'package:visa/model/room_model.dart';
import 'package:visa/profile_page.dart';
import 'package:visa/session_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWidth = 0;
  double screenHeight = 0;
  TextEditingController _searchKey = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String pass = '';

  getUser() async {
/*

    Map? user = await SessionServices.getUser();
    if(user!=null){

      setState(() {
        firstName = user["firstName"];
        lastName = user["lastName"];
        phoneNumber = user["phoneNumber"];
        pass = user["password"];});
    }
*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
     
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                // IconButton(
                //   // onPressed: () {
                //   //   Navigator.pop(context);
                //   // },
                //   icon: Icon(
                //     Icons.menu,
                //     size: 24,
                //     color: Colors.white,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _scaffoldKey.currentState!
                //           .openDrawer();
                //     });
                //   },
                //   // Icon(
                //   //   Icons.arrow_back_ios,
                //   //   // color: Constants.colorWhite,
                //   // ),
                // ),
                const Spacer(),
                const Center(
                  child: Text(
                    'VISA',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      // color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                // SizedBox(width: 30,),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            GetX<HomeController>(builder: (logic) {
              return logic.rooms.isEmpty
                  ? const Center(
                      child: Text('No data founded'),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: logic.rooms.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(HotelDetailsPage(
                                    image: logic.rooms[index].image.toString(),
                                    data: logic.rooms[index]));
                                // Navigator.pushNamed(context, HotelDetailsPage.id);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Card(
                                  elevation: 7,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    // side: BorderSide(color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: screenWidth,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                // assets/
                                                logic.rooms[index].image
                                                    .toString(),
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'رقم الغرفة:  ${logic.rooms[index].number}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    'جنيه ',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    logic.rooms[index].price
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  const Text(
                                                    'السعر  ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ),
                                ),
                              ),
                            );
                          }),
                    );
            }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
