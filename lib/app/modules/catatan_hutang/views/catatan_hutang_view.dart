// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:validators/sanitizers.dart';
// import 'package:warnote_app/app/modules/transaksi/controllers/transaksi_controller.dart';
import 'package:warnote_app/app/routes/app_pages.dart';

import '../controllers/catatan_hutang_controller.dart';

class PageHutang extends StatefulWidget {
  const PageHutang({Key? key}) : super(key: key);

  @override
  CatatanHutangView createState() => CatatanHutangView();
}

class CatatanHutangView extends State<PageHutang> {
  final CatatanHutangController controller = Get.put(CatatanHutangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => Get.toNamed(Routes.TAMBAH_HUTANG),
        child: const Iconify(
          Mdi.add,
          size: 36,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF5A9CFF),
      ),
      backgroundColor: const Color(0xFF5A9CFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Hutang',
          // textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 1,
            // fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
                child: Container(
                  width: 320,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 140,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFADE792),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Total Hutang',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    // color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            StreamBuilder(
                                stream: controller.streamData(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    var totalHutang = snapshot.data!.docs;
                                    int sumPenjualan = 0;
                                    for (var i = 0;
                                        i < totalHutang.length;
                                        i++) {
                                      sumPenjualan = sumPenjualan +
                                          toInt(totalHutang[i]['jumlah'])
                                              .toInt();
                                      print(sumPenjualan);
                                    }
                                    return Flexible(
                                      child: ListView(
                                        shrinkWrap: true,
                                        // itemCount: listAllDocs.length,

                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Center(
                                              child: Text(
                                                "Rp${sumPenjualan}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }),
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      Container(
                        width: 140,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0FF42),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Jumlah Hutang',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            StreamBuilder<QuerySnapshot<Object?>>(
                                stream: controller.streamData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    var listAllDocs = snapshot.data!.docs;

                                    return Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "${listAllDocs.length}",
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Container(
                  width: 360,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.history,
                                size: 35,
                              ),
                            ),
                            Text(
                              'Riwayat Hutang',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<QuerySnapshot<Object?>>(
                        stream: controller.streamData(),
                        builder: (context, snapshot) {
                          print(snapshot);
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            var listAllDocs = snapshot.data!.docs;
                            // ignore: prefer_is_empty
                            return listAllDocs.length > 0
                                ? Flexible(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: listAllDocs.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          color: const Color(0xFF0A2647),
                                          elevation: 20,
                                          // shadowColor: Colors.purple[400],
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 10),
                                                  child: Text(
                                                    "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 5),
                                                  child: Text(
                                                    "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["jumlah"]}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, right: 10),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      "${(listAllDocs[index].data() as Map<String, dynamic>)["tanggal"]}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () =>
                                                          Get.toNamed(
                                                              Routes
                                                                  .EDIT_HUTANG,
                                                              arguments:
                                                                  listAllDocs[
                                                                          index]
                                                                      .id),
                                                      icon: const Icon(
                                                        Icons.edit_rounded,
                                                        size: 28,
                                                        color:
                                                            Colors.greenAccent,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    IconButton(
                                                      onPressed: () =>
                                                          controller.deleteData(
                                                              listAllDocs[index]
                                                                  .id),
                                                      icon: const Icon(
                                                        Icons.delete_rounded,
                                                        size: 28,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      'Belum ada hutang. Silahkan buat terlebih dahulu.',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 14,
                                      )),
                                    ),
                                  );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.'; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    // ignore: prefer_is_empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          // ignore: curly_braces_in_flow_control_structures
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
