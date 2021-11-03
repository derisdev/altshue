import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bank_account_controller.dart';

class BankAccountView extends GetView<BankAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BankAccountView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BankAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
