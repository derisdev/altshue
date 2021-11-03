import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? descC = TextEditingController();

  final isErrorEmail = false.obs;
  final isErrorDesc = false.obs;
  final formGlobalKey = GlobalKey<FormState>();

  void send() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorEmail.value &&
        !isErrorDesc.value) {}
  }

  @override
  void dispose() {
    emailC!.dispose();
    descC!.dispose();
    super.dispose();
  }
}
