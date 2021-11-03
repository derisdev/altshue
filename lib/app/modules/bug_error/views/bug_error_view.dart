import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bug_error_controller.dart';

class BugErrorView extends GetView<BugErrorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BugErrorView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BugErrorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
