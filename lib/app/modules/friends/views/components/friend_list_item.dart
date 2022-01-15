import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/friends/models/friend.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FriendListItem extends StatelessWidget {
  const FriendListItem({
    Key? key,
    required this.dataFriend,
  }) : super(key: key);
  final DataFriend dataFriend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      child: Container(
          padding: EdgeInsets.only(left: 18, bottom: 22, top: 22),
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
              ]),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 33,
                  backgroundImage: NetworkImage(
                      'https://cdn.iconscout.com/icon/free/png-256/avatar-373-456325.png')),
              SizedBox(
                width: 14,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width / 2.6,
                    child: Text(dataFriend.Fullname.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Palette.darkTan,
                            fontSize: 15,
                            fontFamily: AppFontStyle.montserratBold)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Online Time'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Palette.doveGray,
                            fontSize: 12,
                            fontFamily: AppFontStyle.montserratMed),
                      ),
                      Text(
                        ' : 08.00 - 10.00',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Palette.doveGray,
                            fontSize: 12,
                            fontFamily: AppFontStyle.montserratMed),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AssetName.prodigious,
                        height: 20,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        dataFriend.MemberLevel,
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
                padding: const EdgeInsets.only(right: 5.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Palette.valencia,
                    ),
                    SizedBox(
                      height: 2.5,
                    ),
                    Text(
                      '50',
                      style: TextStyle(
                          color: Palette.valencia,
                          fontSize: 12,
                          fontFamily: AppFontStyle.montserratMed),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 23,
              ),
            ],
          )),
    );
  }
}
