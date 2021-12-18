import 'package:flutter/material.dart';

import 'history_redeem_item.dart';

class HistoryListReedem extends StatelessWidget {
  const HistoryListReedem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.symmetric(vertical: 100),
        itemBuilder: (_, index) {
          return HistoryReedemItem(
            index: index,
          );
        });
  }
}
