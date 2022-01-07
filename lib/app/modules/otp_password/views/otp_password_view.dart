import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/otp_password_controller.dart';

class OtpPasswordView extends GetView<OtpPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtpPasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OtpPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
