import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/about_controller.dart';

class About extends StatefulWidget {
  AboutView createState() => AboutView();
  const About({Key? key}) : super(key: key);
}

class AboutView extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Get.back(),
        ),
        title: Text('Tentang Kami',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 40,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Apa itu WarNote ?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
                  tileColor: Colors.grey.shade300,
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'WarNote merupakan sebuah aplikasi pencatatan warung berbasis mobile yang dapat memudahkan para pemilik warung dalam melakukan pencatatan di warung mereka. Seperti Pencatatan transaksi dan hutang.',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          // letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Kontak Developer',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
                  tileColor: Colors.grey.shade300,
                  iconColor: Colors.grey[600],
                  leading: Icon(Icons.mail_outline_rounded),
                  title: Text(
                    'dhifanjulda798@gmail.com',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  onTap: () async {
                    String email =
                        Uri.encodeComponent("mail@dhifanjulda798@gmail.com");
                    Uri mail = Uri.parse("mailto:$email?");
                    if (await launchUrl(mail)) {
                      print('Email terbuka');
                    } else {
                      print('Email tidak terbuka');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
