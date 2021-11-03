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

  void report() {
    if (imagePath.value.isNotEmpty) {
      isErrorImage.value = true;
    } else {
      isErrorImage.value = false;
    }
    if (formGlobalKey.currentState!.validate() &&
        !isErrorImage.value &&
        !isErrorEmail.value &&
        !isErrorDesc.value) {}
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
