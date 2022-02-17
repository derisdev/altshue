import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageNews extends StatelessWidget {
  const ImageNews({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          url,
          fit: BoxFit.cover,
          width: Get.width,
          height: 300,
        ),
        Positioned(
          top: 40,
          left: 22,
          child: Row(
            children: [
              InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Palette.white,
                  )),
              SizedBox(
                width: 10,
              ),
              Text('News'.tr,
                  style: TextStyle(
                      color: Palette.white,
                      fontSize: 17,
                      fontFamily: AppFontStyle.montserratMed)),
            ],
          ),
        ),
      ],
    );
  }
}
