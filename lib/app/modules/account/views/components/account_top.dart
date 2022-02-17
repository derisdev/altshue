import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/modules/account/models/account.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TopAccount extends StatelessWidget {
  const TopAccount({
    Key? key,
    required this.dataAccount,
  }) : super(key: key);

  final DataAccount? dataAccount;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.white,
      height: 114,
      child: Row(
        children: [
          SizedBox(
            width: 21,
          ),
          CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(dataAccount!.Photo.isNotEmpty
                  ? dataAccount!.Photo
                  : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width / 3.2,
                child: Text(dataAccount!.Fullname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Palette.darkTan,
                        fontSize: 17,
                        fontFamily: AppFontStyle.montserratBold)),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                dataAccount!.Email,
                style: TextStyle(
                    color: Palette.doveGray,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratMed),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                dataAccount!.Phone,
                style: TextStyle(
                    color: Palette.doveGray,
                    fontSize: 12,
                    fontFamily: AppFontStyle.montserratMed),
              ),
            ],
          ),
          Spacer(),
          Padding(
              padding: const EdgeInsets.only(right: 19.0),
              child: Stack(
                children: [
                  Container(
                    width: 96,
                    height: 29,
                    decoration: BoxDecoration(
                        color: Palette.dixie,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text('EDIT PROFILE',
                            style: TextStyle(
                                color: Palette.white,
                                fontSize: 10,
                                fontFamily: AppFontStyle.montserratBold))),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () =>
                            Get.toNamed(Routes.EDIT_PROFILE, arguments: {
                          'full_name': dataAccount!.Fullname,
                          'email': dataAccount!.Email,
                          'phone': dataAccount!.Phone,
                          'foto': dataAccount!.Photo,
                          'is_verified': dataAccount!.IsVerified,
                        }),
                        child: SizedBox(
                          width: 96,
                          height: 29,
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
