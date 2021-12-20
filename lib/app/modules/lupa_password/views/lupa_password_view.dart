import 'package:altshue/app/widgets/basic_background.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lupa_password_controller.dart';
import 'components/lupa_password_form.dart';

class LupaPasswordView extends GetView<LupaPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [BasicBackground(), FormLupaPassword()],
        ));
  }
}
