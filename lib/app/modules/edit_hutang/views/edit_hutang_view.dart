import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';

import '../controllers/edit_hutang_controller.dart';

class EditHutang extends StatefulWidget {
  @override
  EditHutangView createState() => EditHutangView();
  EditHutang({Key? key}) : super(key: key);
}

class EditHutangView extends State<EditHutang> {
  final EditHutangController controller = Get.put(EditHutangController());

  DateTime? selectDate = new DateTime.now();

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
          'Edit Hutang',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5A9CFF),
      ),
      body: SafeArea(
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.namaC.text = data['nama'];
              controller.jumlahC.text = data['jumlah'];
              controller.tanggalC.text = data['tanggal'];
              return Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 20, bottom: 250),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF5A9CFF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topRight: Radius.circular(5))),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, top: 50, right: 40),
                        child: TextFormField(
                          controller: controller.namaC,
                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.poppins(),
                          decoration: InputDecoration(
                            // errorText: _validate ? "Data tidak boleh kosong!" : null,
                            hintText: 'Nama',
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Iconify(
                                Mdi.person,
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
                        padding:
                            const EdgeInsets.only(left: 40, top: 10, right: 40),
                        child: TextFormField(
                          style: GoogleFonts.poppins(),
                          controller: controller.jumlahC,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly,
                          //   ThousandsSeparatorInputFormatter(),
                          // ],
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            // errorText: _validate ? "Data tidak boleh kosong!" : null,
                            hintText: 'jumlah',
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
                        padding:
                            const EdgeInsets.only(left: 40, top: 10, right: 40),
                        child: TextFormField(
                          style: GoogleFonts.poppins(),
                          controller: controller.tanggalC,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2050))
                                .then((value) {
                              setState(() {
                                selectDate = value;
                              });
                            });
                            // DateTime? pickedDate = await showDatePicker(
                            //   context: context,
                            //   initialDate: DateTime.now(),
                            //   firstDate: DateTime(2000),
                            //   lastDate: DateTime(2050),
                            // );
                            // if (pickedDate != null) {
                            //   setState(() {
                            //     controller.tanggalC.text =
                            //         DateFormat('yyyy-MM-dd').format(pickedDate);
                            //   });
                            // }
                          },
                          // textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
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
                        padding:
                            const EdgeInsets.only(top: 50, left: 40, right: 40),
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF393E46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              controller.editTransaction(
                                controller.namaC.text,
                                controller.jumlahC.text,
                                controller.tanggalC.text,
                                Get.arguments,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Edit',
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
              );
            }
            return Center(child: CircularProgressIndicator());
          },
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
