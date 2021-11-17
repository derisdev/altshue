import 'package:flutter/material.dart';

import 'list_people_item.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({
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
