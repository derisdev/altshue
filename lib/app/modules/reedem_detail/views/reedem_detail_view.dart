import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reedem_detail_controller.dart';

class ReedemDetailView extends GetView<ReedemDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(
        children: [
          ImageTop(),
          Title(),
          Description(),
          SizedBox(height: 24),
          ReedemButton()
        ],
      ),
    ));
  }
}

class ReedemButton extends StatelessWidget {
  const ReedemButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
              width: 186,
              height: 41,
              decoration: BoxDecoration(
                  color: Palette.dixie, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.ac_unit, size: 20),
                  SizedBox(width: 12),
                  Text('REDEEM',
                      style: TextStyle(
                          color: Palette.white,
                          fontSize: 14,
                          fontFamily: AppFontStyle.montserratBold)),
                ]),
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 96,
                  height: 29,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 35.0, right: 50, top: 36, bottom: 24),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ac ornare nibh. Donec non consequat purus, vitae iaculis quam. Donec pulvinar cursus elit, in tincidunt sapien sagittis et. Donec sit amet diam venenatis, accumsan dui non, mattis felis. Vivamus tempus nulla dui, et congue eros varius tincidunt. Aenean at nulla ac tortor venenatis lacinia ut eu enim. Duis risus sem, maximus eget lobortis ornare, maximus sednisl.',
        textAlign: TextAlign.justify,
        style: TextStyle(
            color: Palette.mineShaft,
            height: 1.5,
            fontSize: 15,
            fontFamily: AppFontStyle.robotoReg),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 105,
        width: Get.width,
        color: Palette.darkTan,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 27),
            Text(
              'Gift 1',
              style: TextStyle(
                  color: Palette.white,
                  fontSize: 20,
                  fontFamily: AppFontStyle.montserratBold),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Palette.white,
                ),
                SizedBox(width: 7),
                Text(
                  '500 A.P',
                  style: TextStyle(
                      color: Palette.amber,
                      fontSize: 14,
                      fontFamily: AppFontStyle.montserratBold),
                ),
              ],
            )
          ],
        ));
  }
}

class ImageTop extends StatelessWidget {
  const ImageTop({
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
