import 'package:altshue/app/modules/contact/models/contact.dart';
import 'package:altshue/app/modules/contact/providers/contact_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContactController extends GetxController with StateMixin<DataGetContact> {
  void getContact() {
    ContactProvider().getContact().then((response) {
      if (response.status == 200) {
        if (response.data.isNotEmpty) {
          change(response.data[0], status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error(response.message));
      }
    });
  }

  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? descC = TextEditingController();

  final isErrorEmail = false.obs;
  final isErrorDesc = false.obs;
  final formGlobalKey = GlobalKey<FormState>();

  final isLoadingButton = false.obs;

  void send() {
    if (formGlobalKey.currentState!.validate() &&
        !isErrorEmail.value &&
        !isErrorDesc.value) {
      isLoadingButton.value = true;
      Map dataContact = {
        'UserEmail': emailC!.text,
        'Help': descC!.text,
      };
      ContactProvider().sendContact(dataContact: dataContact).then((response) {
        isLoadingButton.value = false;
        if (response.status == 200) {
          showToasts(text: 'Terima kasih!'.tr);
          Get.back();
        } else {
          showToasts(text: response.message);
        }
      });
    }
  }

  @override
  void onInit() {
    getContact();
    super.onInit();
  }

  @override
  void dispose() {
    emailC!.dispose();
    descC!.dispose();
    super.dispose();
  }
}
