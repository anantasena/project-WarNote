import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/catatan/bindings/catatan_binding.dart';
import '../modules/catatan/views/catatan_view.dart';
import '../modules/catatan_hutang/bindings/catatan_hutang_binding.dart';
import '../modules/catatan_hutang/views/catatan_hutang_view.dart';
import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/edit_catatan/bindings/edit_catatan_binding.dart';
import '../modules/edit_catatan/views/edit_catatan_view.dart';
import '../modules/edit_hutang/bindings/edit_hutang_binding.dart';
import '../modules/edit_hutang/views/edit_hutang_view.dart';
import '../modules/edit_transaksi/bindings/edit_transaksi_binding.dart';
import '../modules/edit_transaksi/views/edit_transaksi_view.dart';
import '../modules/halaman/bindings/halaman_binding.dart';
import '../modules/halaman/views/halaman_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profil_saya/bindings/profil_saya_binding.dart';
import '../modules/profil_saya/views/profil_saya_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/tambah_catatan/bindings/tambah_catatan_binding.dart';
import '../modules/tambah_catatan/views/tambah_catatan_view.dart';
import '../modules/tambah_hutang/bindings/tambah_hutang_binding.dart';
import '../modules/tambah_hutang/views/tambah_hutang_view.dart';
import '../modules/tambah_transaksi/bindings/tambah_transaksi_binding.dart';
import '../modules/tambah_transaksi/views/tambah_transaksi_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksi/views/transaksi_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => const Transaksi(),
      binding: TransaksiBinding(),
    ),
    GetPage(
      name: _Paths.CATATAN_HUTANG,
      page: () => const PageHutang(),
      binding: CatatanHutangBinding(),
    ),
    GetPage(
      name: _Paths.CATATAN,
      page: () => Catatan(),
      binding: CatatanBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_SAYA,
      page: () => ProfilSayaView(),
      binding: ProfilSayaBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.HALAMAN,
      page: () => const Halaman(),
      binding: HalamanBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => About(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_TRANSAKSI,
      page: () => const TambahTransaksi(),
      binding: TambahTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TRANSAKSI,
      page: () => const EditTransaksi(),
      binding: EditTransaksiBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_HUTANG,
      page: () => const TambahHutang(),
      binding: TambahHutangBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_HUTANG,
      page: () => EditHutang(),
      binding: EditHutangBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_CATATAN,
      page: () => TambahCatatan(),
      binding: TambahCatatanBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CATATAN,
      page: () => EditCatatan(),
      binding: EditCatatanBinding(),
    ),
  ];
}
