import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:warnote_app/app/controllers/auth_controller_controller.dart';
import 'package:warnote_app/app/modules/login/views/login_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key ? key}) : super(key: key);
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);
          return GetMaterialApp(
            title: "Application",
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HALAMAN
                    : Routes.LOGIN,
            getPages: AppPages.routes,
            // home: snapshot.data != null ? Halaman() : LoginView(),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      // ),
    );
  }
}
