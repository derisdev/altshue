import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ImageRedeem extends StatelessWidget {
  const ImageRedeem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://blog.spoongraphics.co.uk/wp-content/uploads/2015/11/thumbnail9.jpg',
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
              Text('Gift 1',
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
