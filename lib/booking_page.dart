import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/controller/home_controller.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);
  static const id = 'booking_page';

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                // IconButton(
                //   onPressed: () {
                //     homeProvider.index=0;
                //     // Navigator.pop(context);
                //   },
                //   icon: Icon(
                //     Icons.arrow_back_ios,
                //     color: Colors.black,
                //   ),
                // ),
                const Spacer(),
                Center(
                  child: Text(
                    'الحجوزات',
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.black,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                // SizedBox(width: 30,),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GetX<HomeController>(builder: (logic) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: logic.services.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Card(
                            elevation: 7,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              // side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    'غرفة رقم: ${logic.services[index].roomNo}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Spacer(),
                                    Text(
                                      logic.services[index].roomCount
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 110,
                                      child: Text(
                                        'عدد الايام',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Spacer(),
                                    Text(
                                      logic.services[index].startDate
                                          .toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 110,
                                      child: Text(
                                        'بداية الحجز',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Spacer(),
                                    Text(
                                      logic.services[index].endDate.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 110,
                                      child: Text(
                                        'نهاية الحجز',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Spacer(),
                                    const Text(
                                      '   جنيه ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      logic.services[index].price.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        // fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 110,
                                      child: Text(
                                        'السعر',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        );
                      }));
            })
          ],
        ),
      ),
    );
  }
}
