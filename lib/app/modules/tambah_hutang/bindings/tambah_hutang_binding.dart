import 'package:get/get.dart';

import '../controllers/tambah_hutang_controller.dart';

class TambahHutangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahHutangController>(
      () => TambahHutangController(),
    );
  }
}
