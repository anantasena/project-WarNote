import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:warnote_app/app/modules/login/controllers/login_controller.dart';
import 'package:warnote_app/app/controllers/auth_controller_controller.dart';

import 'package:get/get.dart';
import 'package:warnote_app/app/routes/app_pages.dart';
// import 'package:warnote_app/app/utils/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
// import 'package:warnote_app/app/controllers/auth_controller_controller.dart';
// import 'package:warnote_app/app/modules/daftar/views/daftar_view.dart';
// import 'package:warnote_app/app/modules/halaman/views/halaman_view.dart';
// import 'package:warnote_app/app/modules/home/views/home_view.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(90, 156, 255, 1),
        body: SafeArea(
          bottom: false,
          left: false,
          top: false,
          right: false,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Center(
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 67, right: 40),
                  child: TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Iconify(
                          Mdi.user,
                          color: Colors.blue,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.clearText();
                        },
                        icon: const Iconify(
                          Mdi.close,
                          color: Colors.grey,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(220, 220, 220, 1),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: controller.passwordController,
                    obscureText: true,
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Iconify(
                          Mdi.password,
                          color: Colors.blue,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(220, 220, 220, 1),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 5),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        'Lupa password?',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                      // onTap: () => Get.toNamed(Routes.DAFTAR),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: 330,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF393E46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          controller.checkField();
                          authC.login(
                            controller.emailController.text,
                            controller.passwordController.text,
                          );
                          // navigatorKey.currentState!
                          //     .popUntil((route) => route.isFirst);
                        } on Exception catch (e) {
                          print(e);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Log In',
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.DAFTAR),
                  child: Text(
                    'Daftar akun',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
