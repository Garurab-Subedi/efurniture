import 'package:flutter/material.dart';
import 'package:furniture/app/modules/cart/views/cart_view.dart';
import 'package:furniture/app/modules/home/views/home_view.dart';
import 'package:furniture/app/modules/orderdetails/views/orderdetails_view.dart';
import 'package:furniture/app/modules/profile/views/profile_view.dart';
import 'package:furniture/app/modules/shipping/views/shipping_view.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;
  List<Widget> screens = [
    const HomeView(),
    // const BookingsView(),
    const CartView(),
    const OrderdetailsView(),
    const ProfileView()
  ];

  final count = 0.obs;

  void increment() => count.value++;
}
