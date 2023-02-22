import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';

import '../controllers/tambah_transaksi_controller.dart';

class TambahTransaksi extends StatefulWidget {
  @override
  TambahTransaksiView createState() => TambahTransaksiView();
  const TambahTransaksi({Key? key}) : super(key: key);
}

class TambahTransaksiView extends State<TambahTransaksi> {
  final TambahTransaksiController controller =
      Get.put(TambahTransaksiController());

  // bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          'Tambah Transaksi',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5A9CFF),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.red,
            ),
            child: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    unselectedLabelStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      // color: const Color(0xFF5A9CFF),
                      color: Colors.greenAccent[400],
                    ),
                    tabs: [
                      Tab(
                        // icon: Icon(Icons.add_a_photo_rounded),
                        child: Text(
                          'Penjualan',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Pengeluaran',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 140),
                      child: TabBarView(
                        children: [
                          // TAB BAR VIEW 1
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF5A9CFF),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                      right: 20,
                                    ),
                                    child: TextFormField(
                                      controller: controller.namabarangC,
                                      textInputAction: TextInputAction.next,
                                      style: GoogleFonts.poppins(),
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Nama Barang',
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Iconify(
                                            Mdi.cart,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, right: 20),
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(),
                                      controller: controller.hargaC,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        // ThousandsSeparatorInputFormatter(),
                                      ],
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Harga',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.rupiahSign,
                                          size: 24,
                                          color: Color(0xFF5A9CFF),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, right: 20),
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(),
                                      // readOnly: true,
                                      controller: controller.hargapokokC,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        // ThousandsSeparatorInputFormatter(),
                                      ],
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Harga Pokok',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.rupiahSign,
                                          size: 24,
                                          color: Color(0xFF5A9CFF),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, right: 20),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Keuntungan: ${controller.keuntungan()}",
                                        style: GoogleFonts.poppins(
                                          textStyle:
                                              TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, right: 100),
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(),
                                      controller: controller.tanggalpenjualanC,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2050),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            controller.tanggalpenjualanC.text =
                                                DateFormat.yMMMMd('en_US')
                                                    .format(pickedDate);
                                          });
                                        }
                                      },
                                      // textInputAction: TextInputAction.done,
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Tanggal',
                                        prefixIcon: Iconify(
                                          Mdi.calendar_month_outline,
                                          size: 24,
                                          color: Color(0xFF5A9CFF),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: SizedBox(
                                      width: 320,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF393E46),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        onPressed: () {
                                          controller.checkfieldPenjualan();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Tambah',
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // TAB BAR VIEW 2
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF5A9CFF),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                      right: 20,
                                    ),
                                    child: TextFormField(
                                      controller: controller.kategoriC,
                                      textInputAction: TextInputAction.next,
                                      style: GoogleFonts.poppins(),
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Kategori',
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Iconify(
                                            Mdi.cart,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, right: 20),
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(),
                                      controller: controller.nominalC,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        // ThousandsSeparatorInputFormatter(),
                                      ],
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Nominal',
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.rupiahSign,
                                          size: 24,
                                          color: Color(0xFF5A9CFF),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, right: 150),
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(),
                                      controller:
                                          controller.tanggalpengeluaranC,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2050),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            controller
                                                    .tanggalpengeluaranC.text =
                                                DateFormat.yMMMMd('en_US')
                                                    .format(pickedDate);
                                          });
                                        }
                                      },
                                      // textInputAction: TextInputAction.done,
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Tanggal',
                                        prefixIcon: Iconify(
                                          Mdi.calendar_month_outline,
                                          size: 24,
                                          color: Color(0xFF5A9CFF),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 10,
                                      right: 20,
                                    ),
                                    child: TextFormField(
                                      controller: controller.catatanC,
                                      textInputAction: TextInputAction.done,
                                      style: GoogleFonts.poppins(),
                                      decoration: const InputDecoration(
                                        // errorText: _validate ? "Data tidak boleh kosong!" : null,
                                        hintText: 'Catatan',
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Iconify(
                                            Mdi.notes_outline,
                                            color: Colors.blue,
                                            size: 20,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(220, 220, 220, 1),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 0,
                                            style: BorderStyle.none,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: SizedBox(
                                      width: 320,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF393E46),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        onPressed: () {
                                          controller.checkfieldPengeluaran();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Tambah',
                                            style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class ThousandsSeparatorInputFormatter extends TextInputFormatter {
//   static const separator = '.';

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     // Short-circuit if the new value is empty
//     // ignore: prefer_is_empty
//     if (newValue.text.length == 0) {
//       return newValue.copyWith(text: '');
//     }

//     // Handle "deletion" of separator character
//     String oldValueText = oldValue.text.replaceAll(separator, '');
//     String newValueText = newValue.text.replaceAll(separator, '');

//     if (oldValue.text.endsWith(separator) &&
//         oldValue.text.length == newValue.text.length + 1) {
//       newValueText = newValueText.substring(0, newValueText.length - 1);
//     }

//     // Only process if the old value and new value are different
//     if (oldValueText != newValueText) {
//       int selectionIndex =
//           newValue.text.length - newValue.selection.extentOffset;
//       final chars = newValueText.split('');

//       String newString = '';
//       for (int i = chars.length - 1; i >= 0; i--) {
//         if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
//           // ignore: curly_braces_in_flow_control_structures
//           newString = separator + newString;
//         newString = chars[i] + newString;
//       }

//       return TextEditingValue(
//         text: newString.toString(),
//         selection: TextSelection.collapsed(
//           offset: newString.length - selectionIndex,
//         ),
//       );
//     }

//     // If the new value and old value are the same, just return as-is
//     return newValue;
//   }
// }
