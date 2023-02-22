import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:warnote_app/app/controllers/auth_controller_controller.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(90, 156, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(90, 156, 255, 1),
        title: Text(
          'Reset Password',
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
                  textInputAction: TextInputAction.done,
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
                      // controller.checkField();
                      authC.resetPassword(
                        controller.emailC.text,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Reset',
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
            ],
          ),
        ),
      ),
      // body: Center(
      //   child: Container(
      //     width: 320,
      //     height: 400,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(5),
      //       color: Colors.white,
      //     ),
      //     child: Column(
      //       children: [
      //         Row(
      //           children: <Widget>[
      //             Padding(
      //               padding: const EdgeInsets.only(
      //                 left: 14,
      //                 top: 5,
      //               ),
      //               child: IconButton(
      //                 onPressed: () => Get.back(),
      //                 icon: const Icon(
      //                   Icons.arrow_back_rounded,
      //                   size: 32,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(
      //                 left: 25,
      //                 top: 5,
      //               ),
      //               child: Text(
      //                 'Reset Password',
      //                 style: GoogleFonts.poppins(
      //                     textStyle: const TextStyle(
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold,
      //                 )),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      //           child: TextFormField(
      //             controller: controller.emailC,
      //             keyboardType: TextInputType.emailAddress,
      //             textInputAction: TextInputAction.next,
      //             style: GoogleFonts.poppins(),
      //             decoration: InputDecoration(
      //               border: OutlineInputBorder(),
      //               labelText: 'Email',
      //               hintText: 'Ketik email...',
      //               prefixIcon: const Padding(
      //                 padding: EdgeInsets.all(8.0),
      //                 child: Iconify(
      //                   Mdi.user,
      //                   color: Colors.blue,
      //                 ),
      //               ),
      //               suffixIcon: IconButton(
      //                 onPressed: () {
      //                   // controller.clearText();
      //                 },
      //                 icon: const Iconify(
      //                   Mdi.close,
      //                   color: Colors.grey,
      //                 ),
      //               ),
      //               // filled: false,
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(
      //             left: 20,
      //             right: 20,
      //             top: 80,
      //             // bottom: 60,
      //           ),
      //           child: ElevatedButton(
      //             child: Text(
      //               'RESET',
      //               style: GoogleFonts.poppins(
      //                   textStyle: const TextStyle(
      //                 fontWeight: FontWeight.bold,
      //               )),
      //             ),
      //             onPressed: () => authC.resetPassword(
      //               controller.emailC.text,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
