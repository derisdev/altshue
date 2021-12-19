import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ShareTypeModel {
  final String assetName;
  final VoidCallback onTap;

  const ShareTypeModel({required this.assetName, required this.onTap});
}

List<ShareTypeModel> dataTypeShare = [
  ShareTypeModel(assetName: AssetName.facebook, onTap: () {}),
  ShareTypeModel(assetName: AssetName.twitter, onTap: () {}),
  ShareTypeModel(assetName: AssetName.instagram, onTap: () {}),
  ShareTypeModel(assetName: AssetName.youtube, onTap: () {}),
];

class FollowUs extends StatelessWidget {
  const FollowUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              dataTypeShare.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ShareType(
                  assetName: dataTypeShare[index].assetName,
                  onTap: dataTypeShare[index].onTap,
                ),
              ),
            )),
        SizedBox(height: 6.3),
        Text(
          'Follow Our Social Media'.tr,
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 10,
              fontFamily: AppFontStyle.montserratReg),
        ),
        SizedBox(height: 6),
        Text(
          '@altshue',
          style: TextStyle(
              color: Palette.mineShaft,
              fontSize: 10,
              fontFamily: AppFontStyle.montserratBold),
        ),
      ],
    );
  }
}

class ShareType extends StatelessWidget {
  const ShareType({
    Key? key,
    required this.assetName,
    required this.onTap,
  }) : super(key: key);

  final String assetName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        assetName,
        height: 20,
      ),
    );
  }
}
