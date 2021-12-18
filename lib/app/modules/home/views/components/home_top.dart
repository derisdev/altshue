import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/home/controllers/home_controller.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopHome extends StatelessWidget {
  const TopHome({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeBg(),
        ProdigiousImage(),
        Container(
          height: Get.height * 0.35,
          padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShoesAndBattery(controller: controller),
              PairAndNewsButton(controller: controller),
            ],
          ),
        )
      ],
    );
  }
}

class PairAndNewsButton extends StatelessWidget {
  const PairAndNewsButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 68,
            height: 24,
            child: Obx(
              () => InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(controller.isConnected.value
                      ? AssetName.paired
                      : AssetName.unpair)),
            )),
        Container(
          height: 23,
          width: 150,
          decoration: BoxDecoration(
              color: Color(0xffEABD6C),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Palette.white)),
          child: Center(
            child: Text('Exp : 1000 / 1000',
                style: TextStyle(
                    color: Palette.white,
                    fontSize: 10,
                    fontFamily: AppFontStyle.montserratBold)),
          ),
        ),
        SizedBox(
            width: 68,
            height: 24,
            child: InkWell(
                onTap: () => Get.toNamed(Routes.NEWS),
                child: SvgPicture.asset(AssetName.news))),
      ],
    );
  }
}

class ShoesAndBattery extends StatelessWidget {
  const ShoesAndBattery({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AssetName.shoes, height: 34),
        Row(
          children: [
            // FaIcon(FontAwesomeIcons.batteryFull,
            //     color: Palette.white),
            SizedBox(
              width: 26,
              height: 13,
              child: Obx(
                () => BatteryIndicator(
                  style: BatteryIndicatorStyle.skeumorphism,
                  showPercentNum: false,
                  batteryLevel: controller.batteryPercent.value,
                  mainColor: Palette.white,
                  showPercentSlide: true,
                ),
              ),
            ),
            SizedBox(
              width: 7.7,
            ),
            Obx(
              () => Text('${controller.batteryPercent.value}%',
                  style: TextStyle(
                      color: Palette.white,
                      fontSize: 12,
                      fontFamily: AppFontStyle.montserratBold)),
            ),
          ],
        )
      ],
    );
  }
}

class ProdigiousImage extends StatelessWidget {
  const ProdigiousImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32,
      left: 0,
      right: 0,
      child: Image.asset(
        AssetName.prodigious,
        height: Get.height * 0.35 - 140,
      ),
    );
  }
}

class HomeBg extends StatelessWidget {
  const HomeBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetName.homeBg,
        height: Get.height * 0.35, width: Get.width, fit: BoxFit.fill);
  }
}
