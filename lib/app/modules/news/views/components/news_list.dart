import 'package:altshue/app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'news_item.dart';

class ListNews extends StatelessWidget {
  const ListNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 120, bottom: 120),
          decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Palette.alto, blurRadius: 4, offset: Offset(0, 1))
              ]),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 20),
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_, index) {
                return Divider(color: Palette.alto);
              },
              itemBuilder: (_, index) {
                return NewsItem(
                  index: index,
                );
              },
            ),
          )),
    );
  }
}
