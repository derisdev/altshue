import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:altshue/app/modules/home/providers/beranda_provider.dart';
import 'package:altshue/app/modules/home/views/home_bluetooth_view.dart';
import 'package:altshue/app/utils/ui/show_toast.dart';
import 'package:battery/battery.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeController extends GetxController {
  final steps = 0.obs;
  int stepCounter = 1;
  int currentStep = 0;
  int duration = 0;
  final durationDisplay = '0'.obs;
  final distance = 0.0.obs;

  bool callcontroller = false;
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
  final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  final String CHARACTERISTIC_UUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  final isConnected = false.obs;

  void changeConnected(BluetoothDevice device) async {
    device.connect();
    callcontroller = true;

    device.state.listen((event) {
      print('event ${event.index}');
      if (event.index == 0) {
        isConnected.value = false;
        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
        changeConnected(device);
      } else {
        if (callcontroller) {
          isConnected.value = true;
          discoverService(device);
          startTimer();
          setDistance();
        }
      }
    });
  }

  discoverService(BluetoothDevice device) async {
    callcontroller = false;

    List<BluetoothService> services = await device.discoverServices();

    for (var service in services) {
      if (service.uuid.toString() == SERVICE_UUID) {
        for (var characteristic in service.characteristics) {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            await characteristic.setNotifyValue(true);
            print('uuid is ${services[2].uuid}');
            characteristic.value.listen((value) {
              print('value dari service ketiga:: ${utf8.decode(value)},');
              if (value.isNotEmpty) {
                if (value[0] > steps.value) {
                  final step = int.parse(utf8.decode(value));
                  if (step == 1 || step == 0) {
                    steps.value = step;
                    currentStep = step;
                  } else {
                    if (step != currentStep) {
                      steps.value = step + stepCounter;
                      stepCounter += 1;
                      currentStep = step;
                    }
                  }
                }
                // saveStep(steps.value);

              }
              //cek untuk setiap 20 menit kirim ke server
              // if (currentTime.value > 20 * 60) {
              //   postActivity(distance: '', hours: '', steps: steps.value.toString());
              //   saveStep(0);
              //   //get activity today
              // }
            });
          }
        }
      }
    }
  }

  StopWatchTimer _stopWatchTimer = StopWatchTimer();

  void startTimer() {
    _stopWatchTimer = StopWatchTimer(
      onChange: (value) {
        final displayTime = StopWatchTimer.getDisplayTimeMinute(value);
        if (displayTime[0] == '0') {
          durationDisplay.value = displayTime.substring(1);
        } else {
          durationDisplay.value = displayTime;
        }
      },
    );
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    _stopWatchTimer.secondTime.listen((value) {
      duration = value;
    });
  }

  //distance

  Location location = Location();

  setDistance() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      print('heading:: ${currentLocation.verticalAccuracy}');
      distance.value += (2 / 1000);
    });
  }

  void toBluetoothList() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

//     BluetoothEnable.enableBluetooth.then((value){
//   if (value == "true"){
//     //Bluetooth has been enabled
//   }
//   else if (result == "false") {
//     //Bluetooth has not been enabled
//   }
// });

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
      } else {
        Get.to(HomeBluetoothView());
      }
    } else {
      Get.to(HomeBluetoothView());
    }
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
