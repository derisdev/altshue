import 'package:flutter/material.dart';

import 'friend_list_item.dart';

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
