import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:visa/controller/auth_controller.dart';
import 'package:visa/session_services.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:visa/widgets/loading.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const id = "profile_page";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //
  // late HomeProvider homeProvider;
  // late UserProvider userProvider;
  bool inAsync = false;
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  bool isEdited = false;
  bool _validPhone = true;
  bool _validFirstName = true;
  bool _validLastName = true;
  String firstName = 'محمد';
  String lastName = 'أحمد';
  String phoneNumber = '0123456789';
  String pass = '';

  getUser() async {
    /* Map? user = await SessionServices.getUser();
    if(user!=null){

      setState(() {
      firstName = user["firstName"];
      lastName = user["lastName"];
      phoneNumber = user["phoneNumber"];
      pass = user["password"];});
    }*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  auth.User? user = auth.FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    //
    // homeProvider = Provider.of<HomeProvider>(context);
    // userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: GetX<AuthController>(builder: (logic) {
            late String name;
            late String email;
            late int number;

            logic.users.forEach(
              (element) {
                if (element.uid == user!.uid) {
                  name = user!.displayName!;
                  _firstName.text = user!.displayName!;
                  email = element.email!;
                  _lastName.text = element.email!;
                  number = element.number!;
                  _phoneNumber.text = element.number!.toString();
                }
              },
            );
            return Column(
              children: [
                Stack(
                  children: [
                    // Container(
                    //   margin: const EdgeInsets.all(
                    //     8,
                    //   ),
                    //   decoration: BoxDecoration(
                    //       color: Theme.of(context).primaryColor,
                    //       shape: BoxShape.circle),
                    //   child: IconButton(
                    //     onPressed: () {
                    //       homeProvider.index=0;
                    //       // Navigator.pop(context);
                    //     },
                    //     icon: const Icon(
                    //       Icons.arrow_back,
                    //     ),
                    //   ),
                    // ),
                    //Spacer(),
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'الصفحة الشخصية',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                    ),
                    //Spacer(),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.asset(
                        //   'assets/images/user_profile.png',
                        //   width: 150,
                        //   height: 150,
                        // ),
                        const SizedBox(
                          height: 128,
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: isEdited
                              ? TextField(
                                  textAlign: TextAlign.start,
                                  controller: _firstName,
                                  decoration: const InputDecoration(
                                      hintText: 'لإسم الأول',
                                      border: InputBorder.none),
                                )
                              : Center(child: Text(name)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        !_validFirstName
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32.0),
                                child: const Text(
                                  'الرجاء إدخال الإسم الأول',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: isEdited
                              ? TextField(
                                  textAlign: TextAlign.start,
                                  controller: _lastName,
                                  decoration: const InputDecoration(
                                      hintText: 'الإسم الإخير',
                                      border: InputBorder.none),
                                )
                              : Center(child: Text(email)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        !_validLastName
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32.0),
                                child: Text(
                                  'الرجاء إدخال الإسم الأخير',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          height: 16,
                        ),

                        Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: isEdited
                              ? TextFormField(
                                  controller: _phoneNumber,
                                  // textAlign: TextAlign.center,
                                  keyboardType: TextInputType.phone,

                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: 'رقم الهاتف',
                                    hintStyle: TextStyle(
                                        // color: Colors.grey[300],
                                        ),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    suffixIcon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      Icons.phone,
                                      // color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  onChanged: (value) {},
                                )
                              : Center(child: Text(number.toString())),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        !_validPhone
                            ? const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32.0),
                                child: const Text(
                                  'الرجاء إدخال رقم الهاتف',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            : const SizedBox(),

                        const SizedBox(
                          height: 25,
                        ),
                        isEdited
                            ? Container(
                                margin: const EdgeInsets.all(16),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    showdilog();
                                    if (_firstName.text.isNotEmpty &&
                                            _lastName.text.isNotEmpty &&
                                            _phoneNumber.text.isNotEmpty ||
                                        _phoneNumber.text.length < 9 ||
                                        _phoneNumber.text.length > 12) {
                                      await user!
                                          .updateDisplayName(_firstName.text);
                                      await user!.reload();
                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(user!.uid)
                                          .update({
                                        "email": _lastName.text,
                                        "number":
                                            int.tryParse(_phoneNumber.text)
                                      });

                                      setState(() {
                                        isEdited = false;
                                        Get.back();
                                      });
                                      setState(() {});
                                    } else {
                                      setState(() {
                                        _validFirstName = true;
                                      });
                                    }
                                    if (_lastName.text.isEmpty) {
                                      setState(() {
                                        _validLastName = false;
                                      });
                                    } else {
                                      setState(() {
                                        _validLastName = true;
                                      });
                                    }
                                    if (_phoneNumber.text.isEmpty ||
                                        _phoneNumber.text.length < 9 ||
                                        _phoneNumber.text.length > 12) {
                                      setState(() {
                                        _validPhone = false;
                                      });
                                    } else {
                                      setState(() {
                                        _validPhone = true;
                                      });
                                    }

                                    if (_validLastName &&
                                        _validFirstName &&
                                        _validPhone) {
                                      print("PPPPP");

                                      /* await SessionServices.saveUser({
                                    "firstName":_firstName.text,
                                    "lastName":_lastName.text,
                                    "phoneNumber":_phoneNumber.text,
                                    "password":pass,
                                  });*/
                                      setState(() {
                                        isEdited = false;
                                      });
                                      // Navigator.pop(context);

                                      // registration('249'+phone);

                                      // setState(() {
                                      //   inAsync = true;
                                      // });
                                      // // userProvider.accessToken
                                      // ApiResult apiResult1 = await AuthenticationServices.sendOTP(userProvider.user!.uuid,userProvider.user!.phone_number,);
                                      // setState(() {
                                      //   inAsync = false;
                                      // });
                                    }

                                    //
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        right: 32, left: 32, top: 8, bottom: 8),
                                    child: const Text(
                                      'تحديث',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.all(16),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    _firstName.text = firstName;
                                    _lastName.text = lastName;
                                    _phoneNumber.text = phoneNumber;

                                    setState(() {
                                      isEdited = true;
                                    });
                                    //
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        right: 32, left: 32, top: 8, bottom: 8),
                                    child: const Text(
                                      'تعديل',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
// registration (String phoneNumber)async{
//
//   setState(() {
//     inAsync = true;
//   });
//   ApiResult apiResult = await AuthenticationServices.createPassenger( _firstName.text, _lastName.text,phoneNumber,_pass.text);
//   setState(() {
//     inAsync = false;
//   });
//
//   print(apiResult.hasError);
//   if(!apiResult.hasError){
//     UserModel user = apiResult.data;
//     print(user.lastname);
//     await SessionServices.saveUser(user);
//     userProvider.user = user;
//     setState(() {
//       inAsync = true;
//     });
//     // userProvider.accessToken
//     ApiResult apiResult1 = await AuthenticationServices.sendOTP(userProvider.user!.uuid,userProvider.user!.phone_number,);
//     setState(() {
//       inAsync = false;
//     });
//     if(!apiResult1.hasError) {
//       Navigator.pushReplacementNamed(context, VerifyPhoneNumberScreen.id);
//     }else{
//
//       UtilitiesServices.showErrorDialog('some_thing_wrong',context);
//       // Navigator.pushReplacementNamed(context, MainScreen.id);
//     }
//     // Navigator.pushReplacementNamed(context, MainScreen.id);
//   }else{
//     UtilitiesServices.showErrorDialog('registration_error_message',context);
//   }
//
// }
}
