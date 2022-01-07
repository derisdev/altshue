import 'dart:io';

import 'package:altshue/app/modules/home/providers/beranda_provider.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:battery/battery.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //activity
  void getActivity() {}

  void postActivity() {
    Map dataActivity = {
      'Steps': '',
      'Distance': '',
      'Hours': '',
    };
    HomeProvider().acitivitySave(dataActivity: dataActivity).then((response) {
      if (response.status == 200) {
      } else {
        showToasts(text: response.message);
      }
    });
  }

  //bluetooth

  final isConnected = false.obs;

  void changeConnected() {
    isConnected.value = true;
  }

  //battery
  final battery = Battery();
  final batteryPercent = 0.obs;

  void changeBattery() async {
    batteryPercent.value = await battery.batteryLevel;
  }

  //close app

  DateTime currentBackPressTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      showToasts(
        text: 'Tekan sekali lagi untuk keluar',
      );
      return Future.value(false);
    }
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
    return Future.value(false);
  }

  @override
  void onInit() {
    changeBattery();
    super.onInit();
  }
}
