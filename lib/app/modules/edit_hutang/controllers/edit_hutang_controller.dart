import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditHutangController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController jumlahC;
  late TextEditingController tanggalC = new TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("data_hutang").doc(docID);
    return docRef.get();
  }

  void editTransaction(
      String nama, String jumlah, String tanggal, String docID) async {
    DocumentReference docData = firestore.collection('data_hutang').doc(docID);

    try {
      await docData.update({
        "nama": nama,
        "jumlah": jumlah,
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
