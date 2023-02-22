// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:warnote_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user!.emailVerified) {
        Get.offAllNamed(Routes.HALAMAN);
      } else {
        Get.defaultDialog(
          title: 'Verifikasi Email',
          middleText:
              'Kamu perlu verifikasi email terlebih dahulu. Ingin verifikasi ulang ?',
          onConfirm: () async {
            await user.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: 'Kirim ulang',
          textCancel: 'Kembali',
          onCancel: () => Get.back(),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Akun belum terdaftar');
        Get.defaultDialog(
          title: 'Oops',
          middleText: 'Akun belum terdaftar.',
        );
      } else if (e.code == 'wrong-password') {
        print('Password salah');
        Get.defaultDialog(
          title: 'Oops',
          middleText: 'Password kamu salah.',
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Oops',
        middleText: 'Tidak dapat login dengan akun ini',
      );
    }
  }

  void signup(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: 'Verifikasi Email',
        middleText: 'Kami telah mengirimkan email verifikasi ke $email',
        textConfirm: 'Oke',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Password terlalu pendek');
        Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Password terlalu lemah',
        );
      } else if (e.code == 'email-already-in-use') {
        print('Akun sudah ada dengan email itu');
        Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Akun sudah ada dengan email itu',
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Tidak dapat mendaftarkan akun ini',
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Reset password berhasil dikirim ke email $email',
          textConfirm: 'Ok',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      } catch (e) {
        Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Tidak dapat reset password',
        );
      }
    } else {
      Get.defaultDialog(
        title: 'Terjadi kesalahan',
        middleText: 'Email tidak valid',
      );
    }
  }
}
