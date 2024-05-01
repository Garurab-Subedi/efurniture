import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture/app/utils/constants.dart';

import 'package:get/get.dart';

import '../controllers/homedetails_controller.dart';

class HomedetailsView extends GetView<HomedetailsController> {
  const HomedetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provides us total height and width
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
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
                icon: SvgPicture.asset('assets/icons/cart_with_item.svg'))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    // the height of this Contaierr is 80$ of our width
                    height: size.width * 0.8,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: size.width * 0.7,
                          width: size.width * 0.7,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                        Image.asset("assets/images/Item_2.png",
                            height: size.width * 0.75,
                            width: size.width * 0.75,
                            fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                          "Poppy plastic tub chair",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        'Rs.350',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kSecondaryColor),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                        child: Text(
                          'data',
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ),
                      SizedBox(height: kDefaultPadding)
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: const Color(0xFFFCBF1E),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/shopping-bag.svg",
                      height: 18,
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                    const Text("Add to Cart",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700)),
                  ]),
            )
          ],
        ));
  }
}
