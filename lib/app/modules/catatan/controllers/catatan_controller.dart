import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatatanController extends GetxController {
  late TextEditingController judulC;
  late TextEditingController catatanC;
  late TextEditingController tanggalC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference catatan = firestore.collection('catatan');
    return catatan.snapshots();
  }

  void editNotes(String judul, String catatan, String tanggal) async {
    CollectionReference transaction = firestore.collection('catatan');

    try {
      await transaction.add({
        "judul": judul,
        "pesan": catatan,
        "tanggal": tanggal,
      });

      Get.defaultDialog(
        title: 'Yeayy',
        middleText: 'Kamu berhasil mengubah catatan baru',
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
        middleText: 'Gagal menambahkan transaksi',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  void deleteData(String docId) {
    DocumentReference docRef = firestore.collection("catatan").doc(docId);

    try {
      Get.defaultDialog(
        title: 'Warning!',
        middleText: 'Apakah kamu yakin ingin menghapus data ini ?',
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A2647),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text('Tidak'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                ),
                onPressed: () async {
                  await docRef.delete();
                  Get.defaultDialog(
                    title: 'Yeayy',
                    middleText: 'Data telah dihapus',
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0A2647),
                        ),
                        onPressed: () {
                          Get.back();
                          Get.back();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
                child: const Text('Ya'),
              ),
            ],
          ),
        ],
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi Kesalahan!',
        middleText: 'Gagal menghapus data!',
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A2647),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
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
