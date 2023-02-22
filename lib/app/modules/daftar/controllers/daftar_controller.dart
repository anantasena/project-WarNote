import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:validators/validators.dart';

import '../../../controllers/auth_controller_controller.dart';
// import 'package:warnote_app/app/modules/daftar/views/daftar_view.dart';

class DaftarController extends GetxController {
  final authC = Get.find<AuthController>();
  // final _formkey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  @override
  void clearText() {
    emailC.clear();
  }

  void checkField() {
    String field1, field2;
    field1 = emailC.text;
    field2 = passwordC.text;

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
    } else {
      authC.signup(
        emailC.text,
        passwordC.text,
      );
    }
  }

  // inputField() {
  //   TextEditingController emailC = TextEditingController();
  //   TextEditingController passwordC = TextEditingController();
  // }

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  // void addUser(
  //   String email,
  //   String password,
  // ) {
  //   CollectionReference registers = firestore.collection('users');

  //   try {
  //     registers.add({
  //       "password": password,
  //       "email": email,
  //     });

  //     Get.defaultDialog(
  //       title: "Berhasil",
  //       middleText: "Berhasil membuat akun",
  //       onConfirm: () => Get.back(),
  //       textConfirm: "Okay",
  //     );
  //   } catch (e) {
  //     print(e);
  //     Get.defaultDialog(
  //       title: "Terjadi kesalahan",
  //       middleText: "Gagal membuat akun",
  //     );
  //   }
  // }

  // @override
  // void Init() {
  //   emailC = TextEditingController();
  //   passwordC = TextEditingController();
  // }

}
