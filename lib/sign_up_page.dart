
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/controller/auth_controller.dart';
import 'package:visa/home_page.dart';
import 'package:visa/session_services.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const id = "sign_up_page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    final width = data.size.width;
    final height = data.size.height;

    return Scaffold(
      body: SafeArea(

          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                         horizontal: 8
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      //Spacer(),
                      Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                               SizedBox(height: 20,),
                              Text(
                                'إنشاء حساب',
                                style:  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                               SizedBox(height: 20,),
                            ],
                          )),
                      //Spacer(),
                    ],
                  ),
                ),
                Form(
              key: controller.formKey2,
              child: Expanded(
                child: ListView(
                  // padding: EdgeInsets.only(top: height * 0.05),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding:
                            EdgeInsets.only(right: width / 8, left: width / 8),
                        height: height * 0.1,
                        width: width * 1.0,
              
                        // decoration: BoxDecoration(
                        //   color: Colors.grey[500].withOpacity(0.5),
                        //   borderRadius: BorderRadius.circular(16),
                        // ),
                        child: TextFormField(
                          controller: controller.name,
                          validator: (val) {
                            return controller.validate(val!);
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 3.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.7),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 24,
                              color: Colors.black,
                            ),
              
                            labelText: 'Name',
              
                            labelStyle: const TextStyle(color: Colors.black),
                            hintStyle: const TextStyle(color: Colors.black),
              
                            // hintText: hint,
                            //  hintStyle: kBodyText,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding:
                            EdgeInsets.only(right: width / 8, left: width / 8),
                        height: height * 0.1,
                        width: width * 1.0,
              
                        // decoration: BoxDecoration(
                        //   color: Colors.grey[500].withOpacity(0.5),
                        //   borderRadius: BorderRadius.circular(16),
                        // ),
                        child: TextFormField(
                          controller: controller.email,
                          validator: (val) {
                            return controller.validateEmail(val!);
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 3.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.7),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 24,
                              color: Colors.black,
                            ),
              
                            labelText: 'Email',
              
                            labelStyle: const TextStyle(color: Colors.black),
                            hintStyle: const TextStyle(color: Colors.black),
              
                            // hintText: hint,
                            //  hintStyle: kBodyText,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding:
                            EdgeInsets.only(right: width / 8, left: width / 8),
                        height: height * 0.1,
                        width: width * 1.0,
              
                        // decoration: BoxDecoration(
                        //   color: Colors.grey[500].withOpacity(0.5),
                        //   borderRadius: BorderRadius.circular(16),
                        // ),
                        child: TextFormField(
                          controller: controller.number,
                          validator: (val) {
                            return controller.validateNumber(val!);
                          },
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 3.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(.7),
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            prefixIcon: const Icon(
                              Icons.phone,
                              size: 28,
                              color: Colors.black,
                            ),
              
                            labelText: 'Phone number',
              
                            labelStyle: const TextStyle(color: Colors.black),
                            // hintText: hint,
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                          style: const TextStyle(color: Colors.black),
              
                          //  style: kBodyText,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding:
                            EdgeInsets.only(right: width / 8, left: width / 8),
                        height: height * 0.1,
                        width: width * 1.0,
              
                        // decoration: BoxDecoration(
                        //   color: Colors.grey[500].withOpacity(0.5),
                        //   borderRadius: BorderRadius.circular(16),
                        // ),
                        child: GetBuilder<AuthController>(
                          builder: (logic) {
                            return TextFormField(
                              controller: logic.password,
                              obscureText: logic.obscureTextSignup,
                              validator: (val) {
                                return logic.validatePassword(val!);
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      logic.toggleSignup();
                                    },
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      logic.obscureTextSignup
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    )),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 3.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(.7),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 24,
                                  color: Colors.black,
                                ),
              
                                labelText: 'Password',
              
                                labelStyle: const TextStyle(color: Colors.black),
                                hintStyle: const TextStyle(color: Colors.black),
              
                                // hintText: hint,
                                //  hintStyle: kBodyText,
                              ),
                              style: const TextStyle(color: Colors.black),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        padding:
                            EdgeInsets.only(right: width / 8, left: width / 8),
                        height: height * 0.1,
                        width: width * 1.0,
              
                        // decoration: BoxDecoration(
                        //   color: Colors.grey[500].withOpacity(0.5),
                        //   borderRadius: BorderRadius.circular(16),
                        // ),
                        child: GetBuilder<AuthController>(
                          builder: (logic) {
                            return TextFormField(
                              controller: logic.repassword,
                              obscureText: logic.obscureTextSignupConfirm,
                              validator: (val) {
                                return logic.validateRePassword(val!);
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      logic.toggleSignupConfirm();
                                    },
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      logic.obscureTextSignupConfirm
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    )),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 3.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(.7),
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 24,
                                  color: Colors.black,
                                ),
              
                                labelText: 'Retype Password',
              
                                labelStyle: const TextStyle(color: Colors.black),
                                hintStyle: const TextStyle(color: Colors.black),
              
                                // hintText: hint,
                                //  hintStyle: kBodyText,
                              ),
                              style: const TextStyle(color: Colors.black),
                            );
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.only(
                                top: height / 45,
                                bottom: height / 45,
                                left: width / 10,
                                right: width / 10)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                        side: const BorderSide(
                                            color: Colors.cyan)))),
                        onPressed: () async {
                          controller.register();
                        },
                        child: const Text(
                          "sign up",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

              ],
            ),
          ),

      ),
    );
  }
}