import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FriendsAddController extends GetxController {
  TextEditingController searchC = TextEditingController();

  @override
  void dispose() {
    searchC.dispose();
    super.dispose();
  }
}
