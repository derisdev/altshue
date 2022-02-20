import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/friends_add/controllers/friends_add_controller.dart';
import 'package:altshue/app/modules/friends_add/models/friend_find.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class PeopleListItem extends GetView<FriendsAddController> {
  const PeopleListItem({
    Key? key,
    required this.index,
    required this.dataFriend,
  }) : super(key: key);

  final int index;
  final DataFriendFind dataFriend;

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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
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
                            fontSize: 16,
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
                padding: const EdgeInsets.only(right: 3.0),
                child: dataFriend.IsFriend
                    ? InkWell(
                        onTap: () => controller.addFriend(
                            requestedMemberId: dataFriend.Id),
                        child: FaIcon(FontAwesomeIcons.userFriends,
                            color: Palette.silver, size: 20),
                      )
                    : Icon(Icons.person_add, color: Palette.darkTan, size: 25),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )),
    );
  }
}
