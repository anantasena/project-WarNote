import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';

import '../controllers/tambah_hutang_controller.dart';

class TambahHutang extends StatefulWidget {
  @override
  TambahHutangView createState() => TambahHutangView();
  const TambahHutang({Key? key}) : super(key: key);
}

class TambahHutangView extends State<TambahHutang> {
  final TambahHutangController controller = Get.put(TambahHutangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Tambah Hutang',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5A9CFF),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 250),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF5A9CFF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                  topRight: Radius.circular(5)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 50, right: 40),
                  child: TextFormField(
                    controller: controller.namaC,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      // errorText: _validate ? "Data tidak boleh kosong!" : null,
                      hintText: 'Nama',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Iconify(
                          Mdi.cart,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(220, 220, 220, 1),
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
                  padding: const EdgeInsets.only(left: 40, top: 10, right: 40),
                  child: TextFormField(
                    style: GoogleFonts.poppins(),
                    controller: controller.jumlahC,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   ThousandsSeparatorInputFormatter(),
                    // ],
                    decoration: const InputDecoration(
                      // errorText: _validate ? "Data tidak boleh kosong!" : null,
                      hintText: 'Jumlah',
                      prefixIcon: Icon(
                        FontAwesomeIcons.rupiahSign,
                        size: 24,
                        color: Color(0xFF5A9CFF),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(220, 220, 220, 1),
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
                  padding: const EdgeInsets.only(left: 40, top: 10, right: 100),
                  child: TextFormField(
                    style: GoogleFonts.poppins(),
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
                              DateFormat.yMMMMd('en_US').format(pickedDate);
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
                      fillColor: Color.fromRGBO(220, 220, 220, 1),
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
                  padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF393E46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        controller.checkField();
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
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.';

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
