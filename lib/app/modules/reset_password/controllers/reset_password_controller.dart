import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailC = TextEditingController();
  // TextEditingController passwordC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    // passwordController.dispose();
    super.onClose();
  }

  void clearText() {
    emailC.clear();
  }

  void checkField() {
    String field1;
    field1 = emailC.text;

    if (field1 == '') {
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
              primary: Color(0xFF0A2647),
            ),
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      );
    } else {
      print('data sudah diisi');
    }
  }
}
