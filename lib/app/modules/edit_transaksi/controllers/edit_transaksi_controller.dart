import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/sanitizers.dart';

class EditTransaksiController extends GetxController {
  late TextEditingController namabarangC;
  late TextEditingController hargaC;
  late TextEditingController hargapokokC;
  late TextEditingController tanggalC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("penjualan").doc(docID);
    return docRef.get();
  }

  void editTransaction(String nama_barang, String harga, String hargapokok,
      String keuntungan, String tanggal, String docID) async {
    DocumentReference docData = firestore.collection('penjualan').doc(docID);

    try {
      await docData.update({
        "nama_barang": nama_barang,
        "harga": harga,
        "hargapokok": hargapokok,
        "keuntungan": keuntungan,
        "tanggal": tanggal,
      });

      Get.defaultDialog(
        title: 'Yeayy',
        middleText: 'Kamu berhasil mengubah data',
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
        middleText: 'Gagal mengubah data',
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
    tanggalC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namabarangC.dispose();
    hargaC.dispose();
    hargapokokC.dispose();
    tanggalC.dispose();
    super.onClose();
  }

  void clearText() {
    namabarangC.clear();
    hargaC.clear();
    hargapokokC.clear();
    tanggalC.clear();
  }
}
