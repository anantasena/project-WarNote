import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahHutangController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController jumlahC;
  late TextEditingController tanggalC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addTransaction(String nama, String jumlah, String tanggal) async {
    CollectionReference hutang = firestore.collection('data_hutang');

    try {
      await hutang.add({
        "nama": nama,
        "jumlah": jumlah,
        "tanggal": tanggal,
      });

      Get.defaultDialog(
        title: 'Yeayy',
        middleText: 'Kamu berhasil menambahkan hutang baru',
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0A2647),
            ),
            onPressed: () {
              Get.back();
              Get.back();
              clearText();
            },
            child: Text('OK'),
          ),
        ],
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Gagal menambahkan hutang',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  void checkField() {
    String field1, field2, field3;
    field1 = namaC.text;
    field2 = jumlahC.text;
    field3 = tanggalC.text;

    if (field1 == '' || field2 == '' || field3 == '') {
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
      addTransaction(namaC.text, jumlahC.text, tanggalC.text);
    }
  }

  @override
  void onInit() {
    namaC = TextEditingController();
    jumlahC = TextEditingController();
    tanggalC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaC.dispose();
    jumlahC.dispose();
    tanggalC.dispose();
    super.onClose();
  }

  void clearText() {
    namaC.clear();
    jumlahC.clear();
    tanggalC.clear();
  }
}
