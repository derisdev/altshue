import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reedem_controller.dart';

class ReedemView extends GetView<ReedemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReedemView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReedemView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
