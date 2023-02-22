import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilSayaController extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;
}
