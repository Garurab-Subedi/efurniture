import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture/app/utils/constants.dart';

import 'package:get/get.dart';

import '../controllers/homedetails_controller.dart';

class HomedetailsView extends GetView<HomedetailsController> {
  const HomedetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/icons/back.svg")),
        centerTitle: false,
        title: Text(
          'Back'.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assests/icons/cart_with_item.svg'))
        ],
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
