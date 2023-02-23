import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:warnote_app/app/controllers/auth_controller_controller.dart';
import 'package:warnote_app/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:warnote_app/app/routes/app_pages.dart';
// import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  Home createState() => Home();
  const HomeScreen({Key? key}) : super(key: key);
}

class Home extends State<HomeScreen> {
  // AUTH
  final authC = Get.find<AuthController>();
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    controller.tanggalC.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF5A9CFF),
        elevation: 3.0,
        centerTitle: true,
        title: Text(
          'WarNote',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                // color: Colors.red,
                child: Column(
                  children: [
                    Iconify(
                      Mdi.card_account_details_outline,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Iconify(
                Mdi.user_circle_outline,
                color: Colors.blue,
                size: 40,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              title: Text(
                'Profil Saya',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () => Get.toNamed(Routes.PROFIL_SAYA),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              // tileColor: Colors.yellow,
              leading: const Iconify(
                Mdi.about_circle_outline,
                size: 40,
                color: Colors.blue,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              title: Text(
                'Tentang Kami',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () => Get.toNamed(Routes.ABOUT),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              // tileColor: Colors.yellow,
              leading: const Iconify(
                Mdi.share_outline,
                size: 40,
                color: Colors.blue,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              title: Text(
                'Bagikan Aplikasi',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                // Share.shareXFiles('f');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () => authC.logout(),
                child: Text('Logout',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 18,
                    ))),
              ),
            ),
          ],
        ),
      ),
      // BODY
      body: SafeArea(
        child: Container(
          color: Color(0xFF5A9CFF),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: double.infinity,
                  ),
                  width: MediaQuery.of(context).size.width,

                  // height: MediaQuery.of(context).size.height / 4,
                  // width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                // width: 60,
                                padding: const EdgeInsets.all(5),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.event_note_outlined,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  onPressed: () =>
                                      Get.toNamed(Routes.TAMBAH_TRANSAKSI),
                                ),
                                decoration: BoxDecoration(
                                  // color: const Color.fromRGBO(255, 0, 0, 1),
                                  color: Color(0xFF540375),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  'Tambah Transaksi',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                // width: 60,
                                padding: const EdgeInsets.all(5),
                                child: IconButton(
                                  icon: Iconify(
                                    Mdi.sticky_note_add_outline,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  onPressed: () =>
                                      Get.toNamed(Routes.TAMBAH_HUTANG),
                                ),
                                decoration: BoxDecoration(
                                  // color: const Color.fromRGBO(175, 0, 0, 1),
                                  color: Color(0xFFFED049),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  'Tambah Hutang',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                // width: 60,
                                padding: const EdgeInsets.all(5),
                                child: IconButton(
                                  icon: Iconify(
                                    Mdi.sticky_note_text_outline,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  onPressed: () =>
                                      Get.toNamed(Routes.TAMBAH_CATATAN),
                                ),
                                decoration: BoxDecoration(
                                  // color: const Color.fromRGBO(175, 0, 0, 1),
                                  color: Color(0xFF10A19D),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  'Tambah Catatan',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 14, 11, 14),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 11),
                              child: Icon(
                                CarbonIcons.report,
                                size: 40,
                                color: Color(0xFF5A9CFF),
                              ),
                            ),
                            Text(
                              'Laporan Keuangan',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 14, 20, 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 9, top: 10, right: 5),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Pemasukan',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            // backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 74,
                                        ),
                                        child: Text(
                                          'Rp.0',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.green,
                                              // backgroundColor: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Pengeluaran',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            // backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 66,
                                          // bottom: 3,
                                        ),
                                        child: Text(
                                          'Rp.0',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.red,
                                              // backgroundColor: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  indent: 1,
                                  endIndent: 1,
                                  thickness: 1,
                                  color: Colors.black,
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Keuntungan',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            // backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 70,
                                        ),
                                        child: Text(
                                          'Rp.0',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.green,
                                              // backgroundColor: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
