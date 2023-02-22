// import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkField() {
    String field1, field2;
    field1 = emailController.text;
    field2 = passwordController.text;

    if (field1 == '' || field2 == '') {
      Get.defaultDialog(
        title: 'Oops!',
        titleStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        middleText: 'Silahkan isi data anda dengan benar!',
        middleTextStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        // backgroundColor: Color.fromRGBO(90, 156, 255, 1),
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF0A2647),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A2647),
            ),
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clearText() {
    emailController.clear();
    passwordController.clear();
  }
}
