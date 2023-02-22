import 'package:get/get.dart';

import '../controllers/catatan_controller.dart';

class CatatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatatanController>(
      () => CatatanController(),
    );
  }
}
