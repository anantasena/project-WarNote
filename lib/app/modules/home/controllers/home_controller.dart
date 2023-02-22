import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController {
  late TextEditingController namabarangC;
  late TextEditingController hargaC;
  late TextEditingController tanggalC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  void addTransaction(String nama_barang, String harga, String tanggal) async {
    CollectionReference transaction = firestore.collection('transaksi');

    try {
      await transaction.add({
        "nama_barang": nama_barang,
        "harga": harga,
        "tanggal": tanggal,
      });

      Get.defaultDialog(
        title: 'Yeayy',
        middleText: 'Kamu berhasil menambahkan transaksi baru',
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF0A2647),
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
        middleText: 'Gagal menambahkan transaksi',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  @override
  void onInit() {
    namabarangC = TextEditingController();
    hargaC = TextEditingController();
    tanggalC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namabarangC.dispose();
    hargaC.dispose();
    tanggalC.dispose();
    super.onClose();
  }

  @override
  void clearText() {
    namabarangC.clear();
    hargaC.clear();
    tanggalC.clear();
  }
}
