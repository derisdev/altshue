import 'package:altshue/app/constants/asset_path.dart';
import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/routes/app_pages.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Palette.alabaster,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              flexibleSpace: Image(
                image: AssetImage(AssetName.headerBg),
                fit: BoxFit.cover,
              ),
              backgroundColor: Palette.darkTan,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: Palette.dixie,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Container(
                      child: Text('Friend List',
                          style: TextStyle(
                              color: Palette.white,
                              fontSize: 12,
                              fontFamily: AppFontStyle.montserratMed)),
                      alignment: Alignment.center,
                      height: 23,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Palette.white),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                      icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Friend Request',
                          style: TextStyle(
                              color: Palette.white,
                              fontSize: 12,
                              fontFamily: AppFontStyle.montserratMed)),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Palette.dixie, shape: BoxShape.circle),
                        child: Text('1',
                            style: TextStyle(
                                color: Palette.white,
                                fontSize: 10,
                                fontFamily: AppFontStyle.montserratMed)),
                      )
                    ],
                  )),
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Friends',
                    style: TextStyle(
                        color: Palette.white,
                        fontSize: 17,
                        fontFamily: AppFontStyle.montserratMed)),
              ),
              actions: [
                IconButton(
                    onPressed: () => Get.toNamed(Routes.FRIENDS_ADD),
                    icon: Icon(
                      Icons.person_add,
                      color: Palette.white,
                      size: 30,
                    )),
                SizedBox(
                  width: 15,
                )
              ]),
          body: Stack(
            children: [
              TabBarView(
                children: [FriendList(), FriendRequest()],
              ),
              NavigationBar(
                index: 0,
              )
            ],
          )),
    );
  }
}

class FriendRequest extends StatelessWidget {
  const FriendRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (_, index) {
          return FriendRequestItem();
        });
  }
}

class FriendList extends StatelessWidget {
  const FriendList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (_, index) {
          return FriendListItem();
        });
  }
}

class FriendRequestItem extends StatelessWidget {
  const FriendRequestItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 27),
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
                  SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 2,
                        child: Text('John Doe',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Palette.darkTan,
                                fontSize: 17,
                                fontFamily: AppFontStyle.montserratBold)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: Get.width / 2,
                        child: Text(
                          'Online Time : 08.00 - 10.00',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Palette.doveGray,
                              fontSize: 14,
                              fontFamily: AppFontStyle.montserratMed),
                        ),
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
                            'Prodigious',
                            style: TextStyle(
                                color: Palette.doveGray,
                                fontSize: 14,
                                fontFamily: AppFontStyle.montserratMed),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 125,
                      height: 35,
                      child: ButtonGlobal(
                        onTap: () {},
                        title: 'Confirm',
                        radius: 8,
                      )),
                  SizedBox(
                    width: 9,
                  ),
                  SizedBox(
                      width: 125,
                      height: 35,
                      child: ButtonGlobal(
                          onTap: () {},
                          title: 'Delete',
                          radius: 8,
                          primary: Palette.gallery,
                          textColor: Palette.darkTan)),
                ],
              )
            ],
          )),
    );
  }
}

class FriendListItem extends StatelessWidget {
  const FriendListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 27),
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
                  radius: 38,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdRmhKAoSeP_y915jup2ol3qgi1qLa0i2Hbg&usqp=CAU')),
              SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width / 2,
                    child: Text('John Doe',
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
                    'Online Time : 08.00 - 10.00',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Palette.doveGray,
                        fontSize: 14,
                        fontFamily: AppFontStyle.montserratMed),
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
                        'Prodigious',
                        style: TextStyle(
                            color: Palette.doveGray,
                            fontSize: 14,
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
                      height: 2.6,
                    ),
                    Text(
                      '50',
                      style: TextStyle(
                          color: Palette.valencia,
                          fontSize: 14,
                          fontFamily: AppFontStyle.montserratMed),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
