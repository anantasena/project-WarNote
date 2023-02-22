import 'package:get/get.dart';

import '../controllers/halaman_controller.dart';

class HalamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HalamanController>(
      () => HalamanController(),
    );
  }
}
