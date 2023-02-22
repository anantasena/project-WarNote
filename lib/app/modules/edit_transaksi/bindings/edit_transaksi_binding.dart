import 'package:get/get.dart';

import '../controllers/edit_transaksi_controller.dart';

class EditTransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTransaksiController>(
      () => EditTransaksiController(),
    );
  }
}
