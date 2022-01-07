import 'package:altshue/app/widgets/basic_background.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/otp_password_controller.dart';
import 'components/otp_password_form.dart';

class OtpPasswordView extends GetView<OtpPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [BasicBackground(), FormOTPPassword()],
        ));
  }
}
