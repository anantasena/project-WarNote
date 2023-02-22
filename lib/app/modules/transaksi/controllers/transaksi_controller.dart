// ignore_for_file: avoid_print

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:validators/sanitizers.dart';

class TransaksiController extends GetxController {
  late TextEditingController namabarangC;
  late TextEditingController hargaC;
  late TextEditingController tanggalC;
  static int penjualan = 0;
  static int sum = 0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final transaksi = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("penjualan").doc(docID);
    return docRef.get();
  }

  // ignore: non_constant_identifier_names
  void addTransaction(String nama_barang, String harga, String tanggal) async {
    CollectionReference transaction = firestore.collection('penjualan');

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

  // ignore: non_constant_identifier_names
  void editTransaction(String nama_barang, String harga, String tanggal) async {
    CollectionReference transaction = firestore.collection('penjualan');

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
    DocumentReference docRef = firestore.collection("penjualan").doc(docId);

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

  Future<QuerySnapshot<Object?>> oneData() async {
    CollectionReference transaksi = firestore.collection('penjualan');

    return transaksi.get();
  }

  Stream<QuerySnapshot<Object?>> streamdataPenjualan() {
    CollectionReference penjualan = firestore.collection('penjualan');
    return penjualan.snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamdataPengeluaran() {
    CollectionReference pengeluaran = firestore.collection('pengeluaran');
    return pengeluaran.snapshots();
  }

  totalPenjualan() {
    FirebaseFirestore.instance
        .collection('penjualan')
        .get()
        .then(((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        sum = sum + int.parse(result.data()['harga']);
        print(sum);
      });
    }));
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
  // ignore: override_on_non_overriding_member
  void clearText() {
    namabarangC.clear();
    hargaC.clear();
    tanggalC.clear();
  }
}
