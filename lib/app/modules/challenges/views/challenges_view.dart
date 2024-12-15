import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/challenges_controller.dart';

class ChallengesView extends GetView<ChallengesController> {
  const ChallengesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChallengesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChallengesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
