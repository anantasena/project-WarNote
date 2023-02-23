// ignore_for_file: avoid_print, prefer_is_empty, avoid_unnecessary_containers, duplicate_ignore, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:validators/sanitizers.dart';
import 'package:warnote_app/app/routes/app_pages.dart';

import '../controllers/transaksi_controller.dart';

class Transaksi extends StatefulWidget {
  @override
  TransaksiView createState() => TransaksiView();
  const Transaksi({Key? key}) : super(key: key);
}

class TransaksiView extends State<Transaksi> {
  final TransaksiController controller = Get.put(TransaksiController());

  bool penjualanC = false;
  bool pengeluaranC = false;
  // var sumTotal = 0;

  addTransactionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Tambah Transaksi',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ))),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: controller.namabarangC,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: 'Nama barang',
                            icon: Iconify(
                              Mdi.cart,
                              size: 32,
                              color: Color(0xFF5A9CFF),
                            ))),
                    TextFormField(
                        controller: controller.hargaC,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          ThousandsSeparatorInputFormatter(),
                        ],
                        decoration: const InputDecoration(
                            hintText: 'Harga',
                            icon: Icon(
                              FontAwesomeIcons.rupiahSign,
                              size: 32,
                              color: Color(0xFF5A9CFF),
                            ))),
                    TextFormField(
                        controller: controller.tanggalC,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              controller.tanggalC.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            });
                          }
                        },
                        // textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                            hintText: 'Tanggal',
                            icon: Iconify(
                              Mdi.calendar_month_outline,
                              size: 32,
                              color: Color(0xFF5A9CFF),
                            ))),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 15, 0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                          controller.clearText();
                        },
                        icon: const Iconify(
                          Mdi.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 255, 8),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.addTransaction(controller.namabarangC.text,
                              controller.hargaC.text, controller.tanggalC.text);
                        },
                        icon: const Iconify(
                          Mdi.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.TAMBAH_TRANSAKSI),
        // ignore: sort_child_properties_last
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
          'Transaksi',
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
            physics: NeverScrollableScrollPhysics(),
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
                                'Penjualan',
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
                                stream: controller.streamdataPenjualan(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    var total = snapshot.data!.docs;
                                    int sumPenjualan = 0;
                                    for (var i = 0; i < total.length; i++) {
                                      sumPenjualan = sumPenjualan +
                                          toInt(total[i]['harga']).toInt();
                                      print(sumPenjualan);
                                    }
                                    return Flexible(
                                      child: ListView(
                                        shrinkWrap: true,
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
                                          )
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
                          color: Color.fromARGB(255, 255, 105, 123),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                'Pengeluaran',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            StreamBuilder<QuerySnapshot<Object?>>(
                                stream: controller.streamdataPengeluaran(),
                                builder: (context, snapshot) {
                                  print(snapshot);
                                  if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    var total = snapshot.data!.docs;
                                    int sumPengeluaran = 0;
                                    for (var i = 0; i < total.length; i++) {
                                      sumPengeluaran = sumPengeluaran +
                                          toInt(total[i]['nominal']).toInt();
                                      print(sumPengeluaran);
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Rp${sumPengeluaran}",
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
                  top: 88,
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
                              'Riwayat Transaksi',
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
                        stream: controller.streamdataPenjualan(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            var listAllDocs = snapshot.data!.docs;
                            return listAllDocs.length > 0
                                ? Flexible(
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: listAllDocs.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          color: const Color(0xFF0A2647),
                                          elevation: 20,
                                          // shadowColor: Colors.purple[400],
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Text(
                                                  "${(listAllDocs[index].data() as Map<String, dynamic>)["nama_barang"]}",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 5),
                                                child: Text(
                                                  "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["harga"]}",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 5),
                                                child: Text(
                                                  "Keuntungan: ${(listAllDocs[index].data() as Map<String, dynamic>)["keuntungan"]}",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.greenAccent,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "${(listAllDocs[index].data() as Map<String, dynamic>)["tanggal"]}",
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
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    onPressed: () =>
                                                        Get.toNamed(
                                                            Routes
                                                                .EDIT_TRANSAKSI,
                                                            arguments:
                                                                listAllDocs[
                                                                        index]
                                                                    .id),
                                                    icon: const Icon(
                                                      Icons.edit_rounded,
                                                      size: 28,
                                                      color: Colors.greenAccent,
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
                                  )
                                : Center(
                                    child: Text(
                                      'Belum ada transaksi. Silahkan buat terlebih dahulu.',
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
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20, right: 20),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey[200],
                      //         borderRadius: BorderRadius.circular(25)),
                      //     child: DefaultTabController(
                      //       initialIndex: 0,
                      //       length: 2,
                      //       child: Column(
                      //         children: <Widget>[
                      //           TabBar(
                      //             unselectedLabelStyle: TextStyle(
                      //               color: Colors.grey[600],
                      //             ),
                      //             indicator: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(25),
                      //               // color: const Color(0xFF5A9CFF),
                      //               color: Colors.greenAccent[400],
                      //             ),
                      //             tabs: [
                      //               Tab(
                      //                 // icon: Icon(Icons.add_a_photo_rounded),
                      //                 child: Text(
                      //                   'Penjualan',
                      //                   style: GoogleFonts.poppins(
                      //                     textStyle: TextStyle(
                      //                       color: Colors.black87,
                      //                       fontSize: 16,
                      //                       fontWeight: FontWeight.bold,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Tab(
                      //                 child: Text(
                      //                   'Pengeluaran',
                      //                   style: GoogleFonts.poppins(
                      //                     textStyle: TextStyle(
                      //                       color: Colors.black87,
                      //                       fontSize: 16,
                      //                       fontWeight: FontWeight.bold,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),

                      // Expanded(
                      //   child: TabBarView(
                      //     children: [
                      //       StreamBuilder<QuerySnapshot<Object?>>(
                      //         stream:
                      //             controller.streamdataPenjualan(),
                      //         builder: (context, snapshot) {
                      //           if (snapshot.connectionState ==
                      //               ConnectionState.active) {
                      //             var listAllDocs =
                      //                 snapshot.data!.docs;
                      //             return listAllDocs.length > 0
                      //                 ? ListView.builder(
                      //                     shrinkWrap: true,
                      //                     itemCount:
                      //                         listAllDocs.length,
                      //                     itemBuilder:
                      //                         (context, index) =>
                      //                             Padding(
                      //                       padding:
                      //                           const EdgeInsets
                      //                               .all(8.0),
                      //                       child: Card(
                      //                         color: const Color(
                      //                             0xFF0A2647),
                      //                         elevation: 20,
                      //                         // shadowColor: Colors.purple[400],
                      //                         child: Column(
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment
                      //                                   .start,
                      //                           children: <
                      //                               Widget>[
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets
                      //                                           .all(
                      //                                       5.0),
                      //                               child: Text(
                      //                                 "${(listAllDocs[index].data() as Map<String, dynamic>)["nama_barang"]}",
                      //                                 style: GoogleFonts
                      //                                     .poppins(
                      //                                   textStyle:
                      //                                       const TextStyle(
                      //                                     fontSize:
                      //                                         16,
                      //                                     color: Colors
                      //                                         .white,
                      //                                     fontWeight:
                      //                                         FontWeight.bold,
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets
                      //                                           .all(
                      //                                       5.0),
                      //                               child: Text(
                      //                                 "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["harga"]}",
                      //                                 style: GoogleFonts
                      //                                     .poppins(
                      //                                   textStyle:
                      //                                       const TextStyle(
                      //                                     color: Colors
                      //                                         .white,
                      //                                     fontSize:
                      //                                         14,
                      //                                     fontWeight:
                      //                                         FontWeight.bold,
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                             Padding(
                      //                               padding:
                      //                                   const EdgeInsets
                      //                                           .all(
                      //                                       5.0),
                      //                               child: Text(
                      //                                 "Tanggal: ${(listAllDocs[index].data() as Map<String, dynamic>)["tanggal"]}",
                      //                                 style: GoogleFonts
                      //                                     .poppins(
                      //                                   textStyle:
                      //                                       const TextStyle(
                      //                                     color: Colors
                      //                                         .white,
                      //                                     fontSize:
                      //                                         14,
                      //                                     fontWeight:
                      //                                         FontWeight.bold,
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                             Row(
                      //                               mainAxisAlignment:
                      //                                   MainAxisAlignment
                      //                                       .center,
                      //                               children: [
                      //                                 IconButton(
                      //                                   onPressed: () => Get.toNamed(
                      //                                       Routes
                      //                                           .EDIT_TRANSAKSI,
                      //                                       arguments:
                      //                                           listAllDocs[index].id),
                      //                                   icon:
                      //                                       const Icon(
                      //                                     Icons
                      //                                         .edit_rounded,
                      //                                     size:
                      //                                         28,
                      //                                     color: Colors
                      //                                         .greenAccent,
                      //                                   ),
                      //                                 ),
                      //                                 const SizedBox(
                      //                                     width:
                      //                                         5),
                      //                                 IconButton(
                      //                                   onPressed:
                      //                                       () =>
                      //                                           controller.deleteData(listAllDocs[index].id),
                      //                                   icon:
                      //                                       const Icon(
                      //                                     Icons
                      //                                         .delete_rounded,
                      //                                     size:
                      //                                         28,
                      //                                     color: Colors
                      //                                         .red,
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   )
                      //                 : Center(
                      //                     child: Text(
                      //                       'Belum ada transaksi. Silahkan buat terlebih dahulu.',
                      //                       style:
                      //                           GoogleFonts.poppins(
                      //                               textStyle:
                      //                                   const TextStyle(
                      //                         fontSize: 14,
                      //                       )),
                      //                     ),
                      //                   );
                      //           }
                      //           return const Center(
                      //               child:
                      //                   CircularProgressIndicator());
                      //         },
                      //       ),
                      //       Container(
                      //         child: Text('2'),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // Container(
                      // child: DefaultTabController(
                      //   initialIndex: 0,
                      //   length: 2,
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       TabBar(
                      //         unselectedLabelStyle: TextStyle(
                      //           color: Colors.grey[600],
                      //         ),
                      //         indicator: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(25),
                      //           // color: const Color(0xFF5A9CFF),
                      //           color: Colors.greenAccent[400],
                      //         ),
                      //         tabs: [
                      //           Tab(
                      //             // icon: Icon(Icons.add_a_photo_rounded),
                      //             child: Text(
                      //               'Penjualan',
                      //               style: GoogleFonts.poppins(
                      //                 textStyle: TextStyle(
                      //                   color: Colors.black87,
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Tab(
                      //             child: Text(
                      //               'Pengeluaran',
                      //               style: GoogleFonts.poppins(
                      //                 textStyle: TextStyle(
                      //                   color: Colors.black87,
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Expanded(
                      //         child: TabBarView(
                      //           children: [

                      //             StreamBuilder<QuerySnapshot<Object?>>(
                      //               stream:
                      //                   controller.streamdataPengeluaran(),
                      //               builder: (context, snapshot) {
                      //                 if (snapshot.connectionState ==
                      //                     ConnectionState.active) {
                      //                   var listAllDocs =
                      //                       snapshot.data!.docs;
                      //                   return listAllDocs.length > 0
                      //                       ? ListView.builder(
                      //                           // shrinkWrap: true,
                      //                           scrollDirection:
                      //                               Axis.vertical,
                      //                           itemCount:
                      //                               listAllDocs.length,
                      //                           itemBuilder:
                      //                               (context, index) =>
                      //                                   Padding(
                      //                             padding:
                      //                                 const EdgeInsets.all(
                      //                                     8.0),
                      //                             child: Card(
                      //                               color: const Color(
                      //                                   0xFF0A2647),
                      //                               elevation: 20,
                      //                               // shadowColor: Colors.purple[400],
                      //                               child:
                      //                                   SingleChildScrollView(
                      //                                 scrollDirection:
                      //                                     Axis.vertical,
                      //                                 child: Column(
                      //                                   crossAxisAlignment:
                      //                                       CrossAxisAlignment
                      //                                           .start,
                      //                                   children: <Widget>[
                      //                                     Padding(
                      //                                       padding:
                      //                                           const EdgeInsets
                      //                                                   .all(
                      //                                               5.0),
                      //                                       child: Text(
                      //                                         "${(listAllDocs[index].data() as Map<String, dynamic>)["kategori"]}",
                      //                                         style: GoogleFonts
                      //                                             .poppins(
                      //                                           textStyle:
                      //                                               const TextStyle(
                      //                                             fontSize:
                      //                                                 16,
                      //                                             color: Colors
                      //                                                 .white,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .bold,
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                     Padding(
                      //                                       padding:
                      //                                           const EdgeInsets
                      //                                                   .all(
                      //                                               5.0),
                      //                                       child: Text(
                      //                                         "Rp. ${(listAllDocs[index].data() as Map<String, dynamic>)["nominal"]}",
                      //                                         style: GoogleFonts
                      //                                             .poppins(
                      //                                           textStyle:
                      //                                               const TextStyle(
                      //                                             color: Colors
                      //                                                 .white,
                      //                                             fontSize:
                      //                                                 14,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .bold,
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                     Padding(
                      //                                       padding:
                      //                                           const EdgeInsets
                      //                                                   .all(
                      //                                               5.0),
                      //                                       child: Text(
                      //                                         "${(listAllDocs[index].data() as Map<String, dynamic>)["catatan"]}",
                      //                                         style: GoogleFonts
                      //                                             .poppins(
                      //                                           textStyle:
                      //                                               const TextStyle(
                      //                                             color: Colors
                      //                                                 .white,
                      //                                             fontSize:
                      //                                                 14,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .bold,
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                     Padding(
                      //                                       padding:
                      //                                           const EdgeInsets
                      //                                                   .all(
                      //                                               5.0),
                      //                                       child: Text(
                      //                                         "Tanggal: ${(listAllDocs[index].data() as Map<String, dynamic>)["tanggal"]}",
                      //                                         style: GoogleFonts
                      //                                             .poppins(
                      //                                           textStyle:
                      //                                               const TextStyle(
                      //                                             color: Colors
                      //                                                 .white,
                      //                                             fontSize:
                      //                                                 14,
                      //                                             fontWeight:
                      //                                                 FontWeight
                      //                                                     .bold,
                      //                                           ),
                      //                                         ),
                      //                                       ),
                      //                                     ),
                      //                                     Expanded(
                      //                                       child: Row(
                      //                                         mainAxisAlignment:
                      //                                             MainAxisAlignment
                      //                                                 .center,
                      //                                         children: [
                      //                                           IconButton(
                      //                                             onPressed: () => Get.toNamed(
                      //                                                 Routes
                      //                                                     .EDIT_TRANSAKSI,
                      //                                                 arguments:
                      //                                                     listAllDocs[index].id),
                      //                                             icon:
                      //                                                 const Icon(
                      //                                               Icons
                      //                                                   .edit_rounded,
                      //                                               size:
                      //                                                   28,
                      //                                               color: Colors
                      //                                                   .greenAccent,
                      //                                             ),
                      //                                           ),
                      //                                           const SizedBox(
                      //                                               width:
                      //                                                   5),
                      //                                           IconButton(
                      //                                             onPressed:
                      //                                                 () =>
                      //                                                     controller.deleteData(listAllDocs[index].id),
                      //                                             icon:
                      //                                                 const Icon(
                      //                                               Icons
                      //                                                   .delete_rounded,
                      //                                               size:
                      //                                                   28,
                      //                                               color: Colors
                      //                                                   .red,
                      //                                             ),
                      //                                           ),
                      //                                         ],
                      //                                       ),
                      //                                     ),
                      //                                   ],
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         )
                      //                       : Center(
                      //                           child: Text(
                      //                             'Belum ada transaksi. Silahkan buat terlebih dahulu.',
                      //                             style:
                      //                                 GoogleFonts.poppins(
                      //                                     textStyle:
                      //                                         const TextStyle(
                      //                               fontSize: 14,
                      //                             )),
                      //                           ),
                      //                         );
                      //                 }
                      //                 return const Center(
                      //                     child:
                      //                         CircularProgressIndicator());
                      //               },
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // ),
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
