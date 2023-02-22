import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/sanitizers.dart';

class TambahTransaksiController extends GetxController {
  late TextEditingController namabarangC;
  late TextEditingController hargaC;
  late TextEditingController hargapokokC;
  late TextEditingController tanggalpenjualanC;
  late TextEditingController tanggalpengeluaranC;
  late TextEditingController kategoriC;
  late TextEditingController nominalC;
  late TextEditingController catatanC;
  static int penjualan = 0;
  static int sum = 0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void checkfieldPenjualan() {
    String field1, field2, field3, field4;
    field1 = namabarangC.text;
    field2 = hargaC.text;
    field3 = hargapokokC.text;
    field4 = tanggalpenjualanC.text;

    if (field1 == '' || field2 == '' || field3 == '' || field4 == '') {
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
      addPenjualan(namabarangC.text, hargaC.text, hargapokokC.text,
          keuntungan().toString(), tanggalpenjualanC.text);
    }
  }

  void checkfieldPengeluaran() {
    String field1, field2, field3, field4;
    field1 = kategoriC.text;
    field2 = nominalC.text;
    field3 = tanggalpengeluaranC.text;
    field4 = catatanC.text;

    if (field1 == '' || field2 == '' || field3 == '' || field4 == '') {
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
      addPengeluaran(kategoriC.text, nominalC.text, tanggalpengeluaranC.text,
          catatanC.text);
    }
  }

  // ignore: non_constant_identifier_names
  void addPenjualan(String nama_barang, String harga, String hargapokok,
      String keuntungan, String tanggal) async {
    CollectionReference transaction = firestore.collection('penjualan');

    try {
      await transaction.add({
        "nama_barang": nama_barang,
        "harga": harga,
        "harga_pokok": hargapokok,
        "keuntungan": keuntungan,
        "tanggal": tanggal,
      });

      Get.defaultDialog(
        title: 'Yeayy',
        middleText: 'Kamu berhasil menambahkan transaksi baru',
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
      // ignore: avoid_print
      print(e);
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Gagal menambahkan transaksi',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  void addPengeluaran(
      String kategori, String nominal, String tanggal, String catatan) async {
    CollectionReference pengeluaran = firestore.collection('pengeluaran');

    try {
      await pengeluaran.add({
        "kategori": kategori,
        "nominal": nominal,
        "tanggal": tanggal,
        "catatan": catatan,
      });

      Get.defaultDialog(
        title: 'Yeayy',
        middleText: 'Kamu berhasil menambahkan pengeluaran baru',
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
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Gagal menambahkan transaksi',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  keuntungan() {
    var harga = toInt(hargaC.text);
    var hargapokok = toInt(hargapokokC.text);
    var sumTotal = harga - hargapokok;
    return sumTotal;
    // print(sumTotal);
  }

  @override
  void onInit() {
    namabarangC = TextEditingController();
    hargaC = TextEditingController();
    hargapokokC = TextEditingController();
    tanggalpenjualanC = TextEditingController();
    tanggalpengeluaranC = TextEditingController();
    kategoriC = TextEditingController();
    nominalC = TextEditingController();
    catatanC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namabarangC.dispose();
    hargaC.dispose();
    hargapokokC.dispose();
    tanggalpenjualanC.dispose();
    kategoriC.dispose();
    nominalC.dispose();
    tanggalpengeluaranC.dispose();
    catatanC.dispose();
    super.onClose();
  }

  void clearText() {
    namabarangC.clear();
    hargaC.clear();
    hargapokokC.clear();
    tanggalpenjualanC.clear();
    tanggalpengeluaranC.clear();
    kategoriC.clear();
    nominalC.clear();
    catatanC.clear();
  }
}
