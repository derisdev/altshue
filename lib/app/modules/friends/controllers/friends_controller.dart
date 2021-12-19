import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FriendsController extends GetxController {
  PageController pageC = PageController();
  final selectedIndex = 0.obs;

  @override
  void dispose() {
    pageC.dispose();
    super.dispose();
  }
}
