import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/basic_background.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import 'components/register_form.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.black,
        body: Stack(
          children: [BasicBackground(), FormRegister(controller: controller)],
        ));
  }
}
