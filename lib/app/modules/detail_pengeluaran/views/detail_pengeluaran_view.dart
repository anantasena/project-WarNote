import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_pengeluaran_controller.dart';

class DetailPengeluaranView extends GetView<DetailPengeluaranController> {
  const DetailPengeluaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPengeluaranView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailPengeluaranView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
