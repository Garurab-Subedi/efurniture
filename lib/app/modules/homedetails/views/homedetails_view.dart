import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homedetails_controller.dart';

class HomedetailsView extends GetView<HomedetailsController> {
  const HomedetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomedetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomedetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
