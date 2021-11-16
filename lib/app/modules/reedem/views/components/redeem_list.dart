import 'package:altshue/app/modules/reedem/views/components/redeem_item.dart';
import 'package:flutter/material.dart';

class ListReedem extends StatelessWidget {
  const ListReedem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        padding: EdgeInsets.symmetric(vertical: 100),
        itemBuilder: (_, index) {
          return ReedemItem(
            index: index,
          );
        });
  }
}
