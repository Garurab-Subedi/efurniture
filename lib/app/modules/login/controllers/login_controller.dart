import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniture/app/routes/app_pages.dart';
import 'package:furniture/app/utils/constants.dart';
import 'package:furniture/app/utils/memory_management.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/auth/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "email": emailController.text,
            "password": passwordController.text
          }));
      var res = await json.decode(response.body);

      if (res['status'] == true) {
        
        
        showCustomSnackBar(
            message: res['message'], color: Colors.green, isTop: true);
        Get.toNamed(Routes.MAIN);
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
}
