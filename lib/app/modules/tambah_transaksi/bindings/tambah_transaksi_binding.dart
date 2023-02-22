import 'package:get/get.dart';

import '../controllers/tambah_transaksi_controller.dart';

class TambahTransaksiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahTransaksiController>(
      () => TambahTransaksiController(),
    );
  }
}
