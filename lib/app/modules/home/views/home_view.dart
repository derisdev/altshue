import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'components/activity_today.dart';
import 'components/home_mission.dart';
import 'components/home_top.dart';
import 'components/progress_mission.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: () {
            return controller.onWillPop();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  TopHome(
                    controller: controller,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 30),
                        child: MissionProgress(),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !controller.isConnected.value,
                          child: Container(
                            color: Palette.black.withOpacity(0.7),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AssetName.pairText),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        controller.toBluetoothList();
                                        // showDialogBluetooth();
                                      },
                                      child: SvgPicture.asset(AssetName.pair)),
                                  SizedBox(
                                    height: 70,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ),
              Mission(),
              TodayActivity(),
              NavigationBar(
                index: 2,
              )
            ],
          ),
        ));
  }
}

void showDialogBluetooth() {
  Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: HomeBluetoothView(),
      ),
      barrierDismissible: false);
}

class HomeBluetoothView extends StatelessWidget {
  const HomeBluetoothView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          final state = snapshot.data;
          if (state == BluetoothState.on) {
            return FindDevicesScreen();
          }
          return BluetoothOffScreen(state: state);
        });
  }
}

class FindDevicesScreen extends StatelessWidget {
  const FindDevicesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: Get.width,
      padding: EdgeInsets.only(top: 23, bottom: 21),
      decoration: BoxDecoration(
          color: Palette.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SvgPicture.asset(AssetName.bluetooth),
          SizedBox(
            height: 15,
          ),
          Text('Bluetooth',
              style: TextStyle(
                  color: Palette.tundora,
                  fontSize: 16,
                  fontFamily: AppFontStyle.montserratBold)),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<bool>(
            stream: FlutterBlue.instance.isScanning,
            initialData: false,
            builder: (c, snapshot) {
              if (snapshot.data!) {
                return SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Palette.dixie),
                  ),
                );
              } else {
                return InkWell(
                  onTap: () => FlutterBlue.instance
                      .startScan(timeout: Duration(seconds: 4)),
                  child: Text('Scan',
                      style: TextStyle(
                          color: Palette.dixie,
                          fontSize: 14,
                          fontFamily: AppFontStyle.montserratBold)),
                );
              }
            },
          ),
          SizedBox(
            height: 18,
          ),
          Divider(
            thickness: 1.5,
          ),
          StreamBuilder<List<ScanResult>>(
              stream: FlutterBlue.instance.scanResults,
              initialData: [],
              builder: (c, snapshot) => ListView.separated(
                  separatorBuilder: (_, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    var result = snapshot.data;
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Get.find<HomeController>()
                              .changeConnected(result![index].device);
                          Get.back();
                          // Get.to(DeviceScreen(device: result.device));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  result![index].device.name == ""
                                      ? "No Name "
                                      : result[index].device.name,
                                  style: TextStyle(
                                      color: Palette.tundora,
                                      fontSize: 15,
                                      fontFamily: AppFontStyle.montserratBold)),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Not Connected',
                                  style: TextStyle(
                                      color: Palette.dustyGray,
                                      fontSize: 15,
                                      fontFamily: AppFontStyle.montserratMed)),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, this.state}) : super(key: key);

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: Get.width,
      padding: EdgeInsets.only(top: 23, bottom: 21),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(AssetName.bluetooth),
            SizedBox(
              height: 20,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
            ),
          ],
        ),
      ),
    );
  }
}
