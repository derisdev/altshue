import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reedem_detail_controller.dart';

class ReedemDetailView extends GetView<ReedemDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReedemDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReedemDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
