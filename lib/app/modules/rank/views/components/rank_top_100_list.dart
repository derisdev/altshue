import 'package:altshue/app/modules/rank/views/components/rank_top_100_item.dart';
import 'package:flutter/material.dart';

class Top100RankList extends StatelessWidget {
  const Top100RankList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 100),
          itemBuilder: (_, index) {
            return Top100RankITem(
              index: index,
            );
          }),
    );
  }
}
