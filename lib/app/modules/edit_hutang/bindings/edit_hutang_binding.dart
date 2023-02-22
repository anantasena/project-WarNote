import 'package:get/get.dart';

import '../controllers/edit_hutang_controller.dart';

class EditHutangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditHutangController>(
      () => EditHutangController(),
    );
  }
}
