import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/controller/home_controller.dart';
import 'package:visa/widgets/snackbar.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({Key? key, required this.image, required this.data})
      : super(key: key);
  final String image;
  final dynamic data;
  @override
  _HotelDetailsPageState createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  double screenWidth = 0;
  double screenHeight = 0;
  int _value = 42;
  List<String> paymentMethod = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];
  late String _selectedPaymentMethod;

  int paymentMethodId = 0;

  final DateTime _date = DateTime.now();
  late final DateTime startDate1;
  late final DateTime endDate1;
  late String _selectedDate = _date.toString();

  late String startDate = 'قم بإختيار التاريخ';
  late String endDate = 'قم بإختيار التاريخ';

  final TextEditingController _numberOfRoom = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedPaymentMethod = paymentMethod[0];
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: GetBuilder<HomeController>(builder: (logic) {
          return ListView(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: screenWidth,
                // height: 200,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                        // Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: screenWidth,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                          // bottomLeft: Radius.circular(10),
                          // bottomRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            // assets/
                            widget.image,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  'فندق',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  const SizedBox(width: 10),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      // color: Color(grayColor),
                      color: Colors.white,
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        buttonColor: Colors.greenAccent,
                        focusColor: Colors.grey[400],
                        // highlightColor: Colors.grey[400],splashColor: Colors.grey,
                        alignedDropdown: true,
                        child: DropdownButton(
                          hint: const Text(
                            '',
                            style: TextStyle(color: Colors.white),
                          ),
                          // dropdownColor: Colors.blue,
                          elevation: 5,
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).primaryColor,
                            // Colors.white,
                          ),
                          iconSize: 36.0,
                          value: _selectedPaymentMethod,

                          // style: TextStyle(color: greyColor),
                          onChanged: (value) {
                            setState(() {
                              paymentMethodId = 1;
                              _selectedPaymentMethod = value.toString();
                            });

                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          // onTap: ,
                          items: paymentMethod.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 10),
                  const SizedBox(
                    width: 120,
                    child: Text(
                      'عدد الغرف',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // fontSize: 18,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              ),

              // SizedBox(height: 20),

              const SizedBox(height: 20),
              Row(
                children: [
                  // SizedBox(width: 10),
                  const Spacer(),
                  // SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      showCalender(0);
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        startDate,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )),
                    ),
                  ),
                  // SizedBox(width: 10),
                  const SizedBox(
                    width: 120,
                    child: const Text(
                      'بداية الحجز',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  // SizedBox(width: 10),

                  GestureDetector(
                    onTap: () {
                      showCalender(1);
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        endDate,
                        style: TextStyle(color: Theme.of(context).primaryColor
                            // Colors.white,
                            ),
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                    child: Text(
                      'نهاية الحجز',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  if (startDate == 'قم بإختيار التاريخ' ||
                      endDate == 'قم بإختيار التاريخ') {
                    showbar('error', 'subtitle', 'please select date', false);
                  } else {
                    logic.makeService(widget.data.price, widget.data.number,
                        startDate1, endDate1,int.tryParse(_selectedPaymentMethod)!);
                  }
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      // Theme.of(context).primaryColor.withOpacity(.8),
                    ),
                    child: Center(
                        child: Text(
                      'تأكيد الحجز ',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        // Colors.white,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Future<void> showCalender(int id) async {
    // str.substring(0, 10)

    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        // locale: local == 'en' ? const Locale('en') : const Locale('ar'),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).primaryColor,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? const Text(""),
          );
        });
    if (picker != null) {
      setState(() {
        _selectedDate = picker.toString();
        if (id == 0) {
          startDate = _selectedDate.substring(0, 10);
          startDate1 = picker;
        } else {
          endDate = _selectedDate.substring(0, 10);
          endDate1 = picker;
        }
        // getDailyIncom();
      });
      print(picker);
    }
  }
}
