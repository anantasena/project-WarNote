import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';

import '../controllers/edit_catatan_controller.dart';

class EditCatatan extends StatefulWidget {
  EditCatatanView createState() => EditCatatanView();
  const EditCatatan({Key? key}) : super(key: key);
}

class EditCatatanView extends State<EditCatatan> {
  EditCatatanController controller = Get.put(EditCatatanController());

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
          'Edit Catatan',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5A9CFF),
      ),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.judulC.text = data['judul'];
              controller.catatanC.text = data['pesan'];
              controller.tanggalC.text = data['tanggal'];
              return Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 250),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF5A9CFF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(5))),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, top: 50, right: 40),
                        child: TextFormField(
                          controller: controller.judulC,
                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.poppins(),
                          decoration: const InputDecoration(
                            // errorText: _validate ? "Data tidak boleh kosong!" : null,
                            hintText: 'Judul Catatan',

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
                        padding:
                            const EdgeInsets.only(left: 40, top: 10, right: 40),
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
                        padding: const EdgeInsets.only(
                            left: 40, top: 10, right: 100),
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
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
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
                        padding:
                            const EdgeInsets.only(top: 50, left: 40, right: 40),
                        child: SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF393E46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              controller.editCatatan(
                                controller.judulC.text,
                                controller.catatanC.text,
                                controller.tanggalC.text,
                                Get.arguments,
                              );
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
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
