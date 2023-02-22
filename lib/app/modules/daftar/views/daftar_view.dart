import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validators/validators.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:warnote_app/app/controllers/auth_controller_controller.dart';
import 'package:warnote_app/app/modules/login/views/login_view.dart';
import 'package:warnote_app/app/routes/app_pages.dart';
import '../controllers/daftar_controller.dart';

// class Daftar extends StatefulWidget {
//   @override
//   DaftarView createState() => DaftarView();
//   const Daftar({Key? key}) : super(key: key);
// }

class DaftarView extends GetView<DaftarController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(90, 156, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(90, 156, 255, 1),
        title: Text(
          'Daftar Akun',
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 50, right: 40),
                child: TextFormField(
                  controller: controller.emailC,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
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
                  controller: controller.passwordC,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Iconify(
                        Mdi.password,
                        color: Colors.blue,
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(220, 220, 220, 1),
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
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  width: 330,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF393E46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      controller.checkField();
                      // authC.signup(
                      //   controller.emailC.text,
                      //   controller.passwordC.text,
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Buat Akun',
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
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text(
                  'Kembali ke Login',
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
    );
  }
}
