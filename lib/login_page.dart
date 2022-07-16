import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visa/controller/auth_controller.dart';
import 'package:visa/home_page.dart';
import 'package:visa/main_page.dart';
import 'package:visa/session_services.dart';
import 'package:visa/sign_up_page.dart';
import 'package:visa/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  // late UserProvider userProvider;
  // late HomeProvider homeProvider;
  bool inAsync = false;
  bool _validPhone = true;
  bool _validPassword = true;
  final TextEditingController _phoneNumber = TextEditingController();

  final TextEditingController _pass = TextEditingController();
  bool _passwordVisible = false;
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   'assets/images/logo_black.png',
                      //   width: 60,
                      //   height: 60,
                      // ),
                      // const SizedBox(width: 10,),
                      const Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Center(
                          child: Text(
                            'VISA',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(' .. مرحبا',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // const Text(
                  //   'Enter your number to create new account',
                  //   style: TextStyle(),
                  // ),
                  const SizedBox(
                    height: 32,
                  ),
                  // Text('enter_your_phone_number'.tr(),
                  //     style:
                  //     TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          right: width / 100, left: width / 100),
                      height: size.height * 0.1,
                      width: size.width * 0.8,
                      // decoration: BoxDecoration(
                      //  color: Colors.white.withOpacity(0.5),
                      // borderRadius: BorderRadius.circular(16),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          right: width / 100, left: width / 100),
                      height: size.height * 0.1,
                      width: size.width * 0.8,

                      // decoration: BoxDecoration(
                      //   color: Colors.grey[500].withOpacity(0.5),
                      //   borderRadius: BorderRadius.circular(16),
                      // ),
                      child: GetBuilder<AuthController>(
                        builder: (logic) {
                          return TextFormField(
                            controller: logic.password,
                            obscureText: logic.obscureTextLogin,
                            validator: (val) {
                              return logic.validateRePassword(val!);
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    logic.toggleLogin();
                                  },
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    logic.obscureTextLogin
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
                  ElevatedButton(
                    onPressed: () async {
                      controller.login();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 8, bottom: 8),
                      child: const Text(
                        'تسجيل دخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                          text: 'ليس لديك حساب',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(const SignUpPage());
                            },
                          text: 'إنشاء حساب',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submit(String phone, String password) async {
    // homeProvider.index =0;
    // final _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    // _homeProvider.index =0;
    // Navigator.popAndPushNamed(context, MainPage());

    /* Map? user =await SessionServices.getUser();
    print (user);
    if(user !=null){
      if(user["phoneNumber"]==phone&&user["password"]==password){
        Navigator.popAndPushNamed(context, HomePage.id);
      }else {
        print('phone or password Error');
      }}else {
        print('Error');

    }*/
  }
}
