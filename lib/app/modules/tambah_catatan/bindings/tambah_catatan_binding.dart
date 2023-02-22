import 'package:get/get.dart';

import '../controllers/tambah_catatan_controller.dart';

class TambahCatatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahCatatanController>(
      () => TambahCatatanController(),
    );
  }
}
