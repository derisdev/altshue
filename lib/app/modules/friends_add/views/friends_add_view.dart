import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/friends_add_controller.dart';

class FriendsAddView extends GetView<FriendsAddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FriendsAddView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FriendsAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
