import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:carbon_icons/carbon_icons.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
// import 'package:iconify_flutter/icons/carbon.dart';
// import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:persistent_bottom_nav_bar_ccc/persistent-tab-view.dart';
import 'package:unicons/unicons.dart';
import 'package:warnote_app/app/modules/catatan/views/catatan_view.dart';
import 'package:warnote_app/app/modules/catatan_hutang/views/catatan_hutang_view.dart';
import 'package:warnote_app/app/modules/home/views/home_view.dart';
import 'package:warnote_app/app/modules/login/views/login_view.dart';
import 'package:warnote_app/app/modules/transaksi/views/transaksi_view.dart';
import 'package:get/get.dart';

import '../controllers/halaman_controller.dart';

class Halaman extends StatefulWidget {
  @override
  HalamanView createState() => HalamanView();
  const Halaman({Key? key}) : super(key: key);
}

class HalamanView extends State<Halaman> {
  @override
  late PersistentTabController _controlleR;
  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomeScreen(),
    Transaksi(),
    PageHutang(),
    Catatan(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(UniconsLine.home_alt),
      title: ("Home"),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.event_note_outlined),
      title: ("Transaksi"),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Iconify(Mdi.note_add_outline),
      title: ("Hutang"),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Iconify(Mdi.sticky_note_text_outline),
      title: ("Catatan"),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.black,
    ),
  ];
}
