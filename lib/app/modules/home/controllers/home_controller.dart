import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:altshue/app/modules/home/providers/beranda_provider.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:battery/battery.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final steps = 0.obs;
  final currentTime = 0.obs;
  //activity
  void getActivity() {}

  void postActivity(
      {required String steps,
      required String distance,
      required String hours}) {
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

  void changeConnected(BluetoothDevice device) async {
    device.connect();
    // isConnected.value = true;

    List<BluetoothService> services = await device.discoverServices();
    BluetoothCharacteristic bluetoothCharacteristic =
        services[2].characteristics[0];
    await bluetoothCharacteristic.setNotifyValue(true);
    bluetoothCharacteristic.value.listen((value) {
      print('value:: $value');
      if (value.isNotEmpty) {
        if (value[0] > steps.value) {
          steps.value = value[0];
        }
        saveStep(steps.value);
      }

      //cek untuk setiap 20 menit kirim ke server
      // if (currentTime.value > 20 * 60) {
      //   postActivity(distance: '', hours: '', steps: steps.value.toString());
      //   saveStep(0);
      //   //get activity today
      // }
    });

    device.state.listen((event) {
      print('event ${event.index}');
      if (event.index == 0) {
        isConnected.value = false;
      } else {
        isConnected.value = true;
      }
    });
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
