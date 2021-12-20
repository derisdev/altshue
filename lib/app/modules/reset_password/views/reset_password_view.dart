import 'package:altshue/app/widgets/basic_background.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_password_controller.dart';
import 'components/reset_password_form.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [BasicBackground(), FormResetPassword()],
        ));
  }
}
