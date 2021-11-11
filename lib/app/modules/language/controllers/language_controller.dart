import 'package:altshue/app/utils/services/localization_service.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final selectedIndo = false.obs;
  final selectedEng = false.obs;

  void selectIndo() {
    selectedIndo.value = true;
    selectedEng.value = false;
  }

  void selectEnglish() {
    selectedIndo.value = false;
    selectedEng.value = true;
  }

  void changeLanguage() {
    if (selectedIndo.value) {
      LocalizationService().changeLocale('Indonesia');
      Get.back();
    }
    if (selectedEng.value) {
      LocalizationService().changeLocale('English');
      Get.back();
    }
  }
}
