import 'package:altshue/app/constants/colors.dart';
import 'package:altshue/app/widgets/button_global.dart';
import 'package:altshue/app/widgets/header_bar.dart';
import 'package:altshue/app/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/friends_add_controller.dart';

class FriendsAddView extends GetView<FriendsAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.alabaster,
        body: Stack(
          children: [
            ListPeople(),
            Column(
              children: [
                HeaderBar(
                  title: 'Add Friends',
                ),
                Container(
                    height: 103,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    color: Palette.white,
                    child: Stack(
                      children: [
                        SearchField(
                          controller: controller.searchC,
                          hintText: 'Cari..',
                        ),
                        Positioned(
                          bottom: 40,
                          right: 0,
                          child: SizedBox(
                            width: 100,
                            child: ButtonGlobalNoChild(
                              onTap: () {},
                              title: 'SEARCH',
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  Text('SEARCH',
                                      style: TextStyle(
                                          color: Palette.white,
                                          fontSize: 10,
                                          fontFamily:
                                              AppFontStyle.montserratBold)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            )
          ],
        ));
  }
}

class ListPeople extends StatelessWidget {
  const ListPeople({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.symmetric(vertical: 200),
        itemBuilder: (_, index) {
          return PeopleListItem(
            index: index,
          );
        });
  }
}

class PeopleListItem extends StatelessWidget {
  const PeopleListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

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
                    width: Get.width / 2.2,
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
                      Icon(Icons.ac_unit),
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
                padding: const EdgeInsets.only(right: 3.0),
                child:
                index != 0 ? FaIcon(FontAwesomeIcons.userFriends,
                    color:Palette.silver ,
                    size: 23.55):  Icon(Icons.person_add, color: Palette.darkTan,
                    size: 30),
              ),
            ],
          )),
    );
  }
}
