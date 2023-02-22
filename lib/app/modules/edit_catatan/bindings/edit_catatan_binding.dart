import 'package:get/get.dart';

import '../controllers/edit_catatan_controller.dart';

class EditCatatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCatatanController>(
      () => EditCatatanController(),
    );
  }
}
