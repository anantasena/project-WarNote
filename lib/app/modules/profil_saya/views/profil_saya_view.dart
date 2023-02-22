import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../controllers/profil_saya_controller.dart';

class ProfilSayaView extends GetView<ProfilSayaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Get.back(),
        ),
        title: Text('Profil Saya',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          // color: Color(0xFF5A9CFF),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
                  tileColor: Colors.grey.shade300,
                  iconColor: Colors.blue,
                  leading: Icon(Icons.email_rounded),
                  title: Text(
                    controller.user.email!,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
                  tileColor: Colors.grey.shade300,
                  iconColor: Colors.blue,
                  leading: Icon(Icons.key_outlined),
                  title: Text(
                    'Ganti Password',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
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
