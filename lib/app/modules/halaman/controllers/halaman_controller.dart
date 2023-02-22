import 'package:get/get.dart';
import 'package:warnote_app/app/modules/halaman/views/halaman_view.dart';

class HalamanController extends GetxController {
  //TODO: Implement HalamanController
  // PersistentTabController _controller;
  // _controller = PersistentTabController(initialIndex: 0);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
