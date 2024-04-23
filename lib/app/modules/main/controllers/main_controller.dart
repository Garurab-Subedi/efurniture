import 'package:flutter/material.dart';
import 'package:furniture/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';


class MainController extends GetxController {
  final currentIndex = 0.obs;
  List<Widget> screens = [
    const HomeView(),
    // const BookingsView(),
    // const CartView(),
    // const ProfileView()
  ];

  final count = 0.obs;

  void increment() => count.value++;
}
