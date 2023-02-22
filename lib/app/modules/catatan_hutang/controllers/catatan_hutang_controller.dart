// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatatanHutangController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController jumlahC;
  late TextEditingController tanggalC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference hutang = firestore.collection('data_hutang');
    return hutang.snapshots();
  }

  void addTransaction(String nama, String jumlah, String tanggal) async {
    CollectionReference transaction = firestore.collection('transaksi');

    try {
      await transaction.add({
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
        middleText: 'Gagal menambahkan hutang',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  void editTransaction(String nama, String jumlah, String tanggal) async {
    CollectionReference transaction = firestore.collection('data_hutang');

    try {
      await transaction.add({
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
        middleText: 'Gagal menambahkan hutang',
        // textConfirm: 'Ok',
        // onConfirm: () => Get.back(),
      );
    }
  }

  void deleteData(String docId) {
    DocumentReference docRef = firestore.collection("data_hutang").doc(docId);

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
