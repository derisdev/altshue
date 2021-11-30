import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Top100RankITem extends StatelessWidget {
  const Top100RankITem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Container(
            decoration: BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
                ]),
            child: Row(
              children: [
                Container(
                  height: 94,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Palette.darkTan,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Center(
                    child: Text('${index + 1}',
                        style: TextStyle(
                            color: Palette.white,
                            fontSize: 27,
                            fontFamily: AppFontStyle.montserratBoldItalic)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 3.5,
                      child: Text('John Doe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Palette.darkTan,
                              fontSize: 15,
                              fontFamily: AppFontStyle.montserratBold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AssetName.prodigious,
                          height: 18,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Prodigious',
                          style: TextStyle(
                              color: Palette.doveGray,
                              fontSize: 12,
                              fontFamily: AppFontStyle.montserratMed),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 66,
                      height: 24,
                      decoration: BoxDecoration(
                          color: Palette.dixie,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Exp : ',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 11,
                                  fontFamily: AppFontStyle.montserratMed)),
                          Text('200',
                              style: TextStyle(
                                  color: Palette.white,
                                  fontSize: 11,
                                  fontFamily: AppFontStyle.montserratBold)),
                        ],
                      )),
                    )),
              ],
            )));
  }
}
