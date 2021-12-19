import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/basic_background.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ktp_verif_controller.dart';
import 'components/ktp_verif_form.dart';

class KtpVerifView extends GetView<KtpVerifController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.black,
        body: Stack(
          children: [BasicBackground(), FormKTPVerif(controller: controller)],
        ));
  }
}
