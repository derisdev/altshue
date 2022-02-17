import 'package:altshue/app/modules/bug_error/providers/bug_error_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BugErrorController extends GetxController {
  final TextEditingController? emailC = TextEditingController();
  final TextEditingController? descC = TextEditingController();
  final TextEditingController? imageC = TextEditingController();

  final isErrorEmail = false.obs;
  final isErrorDesc = false.obs;
  final isErrorImage = false.obs;
  final imagePath = ''.obs;
  final formGlobalKey = GlobalKey<FormState>();

  final isLoadingButton = false.obs;

  void report() {
    if (imagePath.value.isNotEmpty) {
      isErrorImage.value = true;
    } else {
      isErrorImage.value = false;
    }
    if (formGlobalKey.currentState!.validate() &&
        !isErrorImage.value &&
        !isErrorEmail.value &&
        !isErrorDesc.value) {
      isLoadingButton.value = true;

      BugErrorProvider()
          .bugError(
              userEmail: emailC!.text,
              bugNote: descC!.text,
              filePath: imagePath.value)
          .then((response) {
        isLoadingButton.value = false;

        if (response.status == 200) {
          showToasts(
              text:
                  'Terima kasih! laporan akan diteruskan ke pihak developer.');
          Get.back();
        } else {
          showToasts(text: response.message);
        }
      });
    }
  }

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path;
      imageC!.text = image.path.split('image_picker').last;
      isErrorImage.value = false;
    } else {
      imagePath.value = '';
    }
  }

  @override
  void dispose() {
    emailC!.dispose();
    descC!.dispose();
    imageC!.dispose();
    super.dispose();
  }
}
