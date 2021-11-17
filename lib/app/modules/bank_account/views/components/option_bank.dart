import 'package:altshue/app/modules/bank_account/controllers/bank_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

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
