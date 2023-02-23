import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:warnote_app/app/routes/app_pages.dart';
import '../controllers/catatan_controller.dart';

class Catatan extends StatefulWidget {
  @override
  CatatanView createState() => CatatanView();
  const Catatan({Key? key}) : super(key: key);
}

class CatatanView extends State<Catatan> {
  CatatanController controller = Get.put(CatatanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.TAMBAH_CATATAN),
        // ignore: sort_child_properties_last
        child: const Iconify(
          Mdi.add,
          size: 36,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF820000),
        heroTag: null,
      ),
      backgroundColor: const Color(0xFF5A9CFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Catatan',
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SafeArea(
          bottom: false,
          left: false,
          top: false,
          right: false,
          child: StreamBuilder<QuerySnapshot<Object?>>(
            stream: controller.streamData(),
            builder: (context, snapshot) {
              // print(snapshot);
              if (snapshot.connectionState == ConnectionState.active) {
                var listAllDocs = snapshot.data!.docs;

                return listAllDocs.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        itemCount: listAllDocs.length,
                        itemBuilder: (BuildContext context, index) => Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 5, right: 5, bottom: 5),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(25),
                            )),
                            semanticContainer: true,
                            color: const Color(0xFF0A2647),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "${(listAllDocs[index].data() as Map<String, dynamic>)["judul"]}",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "${(listAllDocs[index].data() as Map<String, dynamic>)["pesan"]}",
                                      // textAlign: TextAlign.justify,
                                      // maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        letterSpacing: 1.0,
                                        textStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "${(listAllDocs[index].data() as Map<String, dynamic>)["tanggal"]}",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () => Get.toNamed(
                                            Routes.EDIT_CATATAN,
                                            arguments: listAllDocs[index].id),
                                        icon: const Icon(
                                          Icons.edit_rounded,
                                          size: 28,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(
                                                "${(listAllDocs[index].data() as Map<String, dynamic>)["judul"]}",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "${(listAllDocs[index].data() as Map<String, dynamic>)["pesan"]}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "${(listAllDocs[index].data() as Map<String, dynamic>)["tanggal"]}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Get.back(),
                                                  child: const Text("OK"),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Color(0xFF10A19D),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      IconButton(
                                        onPressed: () => controller
                                            .deleteData(listAllDocs[index].id),
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 250, right: 10, bottom: 250),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(25),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Iconify(
                                    Mdi.note_search_outline,
                                    size: 40,
                                  ),
                                  Text(
                                    'Belum ada catatan. Silahkan buat terlebih dahulu.',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
