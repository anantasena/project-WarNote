import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';

import '../controllers/tambah_catatan_controller.dart';

class TambahCatatan extends StatefulWidget {
  TambahCatatanView createState() => TambahCatatanView();
  TambahCatatan({Key? key}) : super(key: key);
}

class TambahCatatanView extends State<TambahCatatan> {
  TambahCatatanController controller = Get.put(TambahCatatanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Tambah Catatan',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5A9CFF),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 240),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  topRight: Radius.circular(5)),
              color: const Color(0xFF5A9CFF),
            ),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 50, right: 40),
                  child: TextFormField(
                    controller: controller.judulC,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      // errorText: _validate ? "Data tidak boleh kosong!" : null,
                      hintText: 'Judul',

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
                  padding: const EdgeInsets.only(left: 40, top: 10, right: 40),
                  child: TextFormField(
                    style: GoogleFonts.poppins(),
                    controller: controller.catatanC,
                    minLines: 3,
                    maxLines: 5,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   // ThousandsSeparatorInputFormatter(),
                    // ],
                    decoration: const InputDecoration(
                      // errorText: _validate ? "Data tidak boleh kosong!" : null,
                      hintText: 'Isi Catatan',

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
                  padding: const EdgeInsets.only(left: 40, top: 10, right: 100),
                  child: TextFormField(
                    style: GoogleFonts.poppins(),
                    controller: controller.tanggalC,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          controller.tanggalC.text =
                              DateFormat.yMMMMd('en_US').format(pickedDate);
                        });
                      }
                    },
                    // textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      // errorText: _validate ? "Data tidak boleh kosong!" : null,
                      hintText: 'Tanggal',
                      prefixIcon: Iconify(
                        Mdi.calendar_month_outline,
                        size: 24,
                        color: Color(0xFF5A9CFF),
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
                  padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF393E46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        controller.checkField();
                        // setState(() {
                        //   controller.namabarangC.text.isEmpty ||
                        //           controller.hargaC.text.isEmpty ||
                        //           controller.tanggalC.text.isEmpty
                        //       ? _validate = true
                        //       : controller.addTransaction(
                        //           controller.namabarangC.text,
                        //           controller.hargaC.text,
                        //           controller.tanggalC.text);
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Tambah',
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
      ),
    );
  }
}
