import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCatatanController extends GetxController {
  late TextEditingController judulC;
  late TextEditingController catatanC;
  late TextEditingController tanggalC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference catatan = firestore.collection("catatan").doc(docID);
    return catatan.get();
  }

  void editCatatan(
      String judul, String pesan, String tanggal, String docID) async {
    DocumentReference docData = firestore.collection('catatan').doc(docID);

    try {
      await docData.update({
        "judul": judul,
        "pesan": pesan,
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

  void clearText() {
    judulC.clear();
    catatanC.clear();
    tanggalC.clear();
  }
}
