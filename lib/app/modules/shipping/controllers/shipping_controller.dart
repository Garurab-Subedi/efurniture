import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniture/app/routes/app_pages.dart';

import 'package:furniture/app/utils/constants.dart';
import 'package:furniture/app/utils/memory_management.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ShippingController extends GetxController {
  //TODO: Implement ShippingController

  final count = 0.obs;

  late TextEditingController orderTypeController;
  late TextEditingController referenceController;

  @override
  void onInit() {
    super.onInit();
    orderTypeController = TextEditingController();
    referenceController = TextEditingController();
  }

  @override
  void onClose() {
    orderTypeController.dispose();
    referenceController.dispose();
    super.onClose();
  }

  Future<void> checkout() async {
    try {
      String? cartID = MemoryManagement.getCart();
      var response = await http.post(Uri.parse('$baseUrl/auth/checkout'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "orderType": orderTypeController.text,
            "reference": referenceController.text,
            "cart_id": cartID,
          }));
      var res = await json.decode(response.body);

      if (res['status'] == true) {
        showCustomSnackBar(
            message: res['message'], color: Colors.green, isTop: true);
        Get.toNamed(Routes.ORDERDETAILS);
      } else {
        showCustomSnackBar(
            message: res['message'], color: Colors.red, isTop: true);
      }
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Something went wrong',
      ));
    }
  }

  void increment() => count.value++;
}
