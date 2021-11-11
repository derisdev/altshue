import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/bank_account_controller.dart';

class BankAccountView extends GetView<BankAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                HeaderBar(
                  title: 'Bank Account'.tr,
                ),
                SizedBox(height: 30),
                SvgPicture.asset(AssetName.bankIllus),
                SizedBox(height: 30),
                BankOption(
                  controller: controller,
                ),
                SizedBox(height: 10),
                ListFieldBank(
                  controller: controller,
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 186,
                  height: 41,
                  child: ButtonGlobal(
                    onTap: () => controller.submit(),
                    radius: 8,
                    fontSize: 14,
                    title: 'SUBMIT'.tr,
                  ),
                ),
              ],
            ),
            NavigationBar(
              index: 4,
            )
          ],
        ));
  }
}

class BankOption extends StatelessWidget {
  const BankOption({Key? key, required this.controller}) : super(key: key);
  final BankAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            Stack(
              children: [
                Obx(
                  () => Container(
                    width: Get.width,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Palette.alto,
                              blurRadius: 4,
                              offset: Offset(0, 1))
                        ]),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                        contentPadding: EdgeInsets.only(left: 15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: SizedBox(),
                          value: controller.filterSelectedSorting.value,
                          style: TextStyle(
                              color: Palette.mineShaft,
                              fontSize: 12,
                              fontFamily: AppFontStyle.montserratReg),
                          isDense: true,
                          isExpanded: true,
                          items: [
                            DropdownMenuItem(
                                child: Text("Choose Bank".tr),
                                value: "Choose Bank"),
                            DropdownMenuItem(child: Text("BNI"), value: "BNI"),
                            DropdownMenuItem(child: Text("BRI"), value: "BRI"),
                            DropdownMenuItem(child: Text("BCA"), value: "BCA"),
                          ],
                          onChanged: (newFilter) {
                            controller
                                .changeFilterSorting(newFilter.toString());
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 15,
                    right: 27,
                    bottom: 0,
                    child: FaIcon(FontAwesomeIcons.chevronDown,
                        size: 15, color: Palette.tundora)),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorBank.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Bank Name is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
          ],
        ));
  }
}

class ListFieldBank extends StatelessWidget {
  const ListFieldBank({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BankAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Form(
        key: controller.formGlobalKey,
        child: Column(
          children: [
            CleanField(
              controller: controller.numberPWC,
              hintText: 'Bank Account Number'.tr,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorNumber.value = true;
                } else {
                  controller.isErrorNumber.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorNumber.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Bank Account Number is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CleanField(
              controller: controller.namePWC,
              hintText: 'Bank Account Name'.tr,
              validator: (String? text) {
                if (text == null || text.isEmpty) {
                  controller.isErrorName.value = true;
                } else {
                  controller.isErrorName.value = false;
                }
                return null;
              },
            ),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => Visibility(
                visible: controller.isErrorName.value,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Bank Account Name is required',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontFamily: AppFontStyle.montserratBold)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
