import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rank_rewards_controller.dart';

class RankRewardsView extends GetView<RankRewardsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RankRewardsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RankRewardsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
