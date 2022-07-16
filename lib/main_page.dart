import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_page/search_page.dart';
import 'package:visa/booking_page.dart';
import 'package:visa/controller/auth_controller.dart';
import 'package:visa/controller/home_controller.dart';
import 'package:visa/home_page.dart';
import 'package:visa/hotel_details_page.dart';
import 'package:visa/model/room_model.dart';
import 'package:visa/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const id = 'main_page';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BookingPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    AuthController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<HomeController>(builder: (controller) {
            return IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<Rooms>(
                  searchStyle: const TextStyle(
                      color: Colors.green, backgroundColor: Colors.black),
                  items: controller.rooms,
                  searchLabel: 'Search rooms',
                  suggestion: const Center(
                    child: Text('Filter rooms by number, price '),
                  ),
                  failure: const Center(
                    child: Text('No rooms found :('),
                  ),
                  filter: (person) => [
                    person.number.toString(),
                    person.price.toString(),
                  ],
                  builder: (person) => ListTile(
                    onTap: () {
                      Get.to(() => HotelDetailsPage(
                            image: person.image.toString(),
                            data: person,
                          ));
                    },
                    title: Text('number: ' + person.number.toString()),
                    subtitle: Text('price:  ' + person.price!.toString()),
                  ),
                ),
              ),
              icon: Icon(Icons.search),
            );
          }),
          IconButton(
              onPressed: () {
                controller.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الصفحة الرئيسية',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'الحجوزات',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الصفحة الشخصية',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
