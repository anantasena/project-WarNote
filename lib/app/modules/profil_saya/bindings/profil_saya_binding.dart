import 'package:get/get.dart';

import '../controllers/profil_saya_controller.dart';

class ProfilSayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilSayaController>(
      () => ProfilSayaController(),
    );
  }
}
