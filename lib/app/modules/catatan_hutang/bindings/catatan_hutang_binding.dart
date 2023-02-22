import 'package:get/get.dart';

import '../controllers/catatan_hutang_controller.dart';

class CatatanHutangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatatanHutangController>(
      () => CatatanHutangController(),
    );
  }
}
