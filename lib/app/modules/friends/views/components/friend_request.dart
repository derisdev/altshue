import 'package:flutter/material.dart';

import 'friend_request_item.dart';

class FriendRequest extends StatelessWidget {
  const FriendRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(top: 20, bottom: 150),
        itemBuilder: (_, index) {
          return FriendRequestItem();
        });
  }
}
