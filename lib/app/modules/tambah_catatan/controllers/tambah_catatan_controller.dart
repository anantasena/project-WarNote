import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahCatatanController extends GetxController {
  late TextEditingController judulC;
  late TextEditingController catatanC;
  late TextEditingController tanggalC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void checkField() {
    String field1, field2, field3;
    field1 = judulC.text;
    field2 = catatanC.text;
    field3 = tanggalC.text;

    if (field1 == '' || field2 == '' || field3 == '') {
      Get.defaultDialog(
        title: 'Oops!',
        titleStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        middleText: 'Silahkan isi data anda dengan benar!',
        middleTextStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        // backgroundColor: Color.fromRGBO(90, 156, 255, 1),
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFF0A2647),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A2647),
            ),
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      );
    } else {
      addNotes(judulC.text, catatanC.text, tanggalC.text);
    }
  }

  void addNotes(String judul, String catatan, String tanggal) async {
    CollectionReference notes = firestore.collection('catatan');

    try {
      await notes.add({
        "judul": judul,
        "pesan": catatan,
        "tanggal": tanggal,
      });

      Get.defaultDialog(
        title: 'Yeayy',
        middleText: 'Kamu berhasil menambahkan catatan baru',
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A2647),
            ),
            onPressed: () {
              Get.back();
              Get.back();
              clearText();
            },
            child: const Text('OK'),
          ),
        ],
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Gagal menambahkan catatan',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  @override
  void onInit() {
    judulC = TextEditingController();
    catatanC = TextEditingController();
    tanggalC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    judulC.dispose();
    catatanC.dispose();
    tanggalC.dispose();
    super.onClose();
  }

  @override
  // ignore: override_on_non_overriding_member
  void clearText() {
    judulC.clear();
    catatanC.clear();
    tanggalC.clear();
  }
}
