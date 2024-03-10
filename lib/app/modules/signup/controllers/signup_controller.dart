import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniture/app/routes/app_pages.dart';
import 'package:furniture/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
 
  late TextEditingController usernameController,
      emailController,
      phoneController,
      addressController,
      passwordController;

  @override
  void onInit() {
    super.onInit();

    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signUp() async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/api/auth/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "username": usernameController.text,
            "email": emailController.text,
            "phone": phoneController.text,
            "address": addressController.text,
            "password": passwordController.text
          }));

      var res = await jsonDecode(response.body);
      if (res['status'] == 200) {
        showCustomSnackBar(message: res['message'], color: Colors.green);
      } else {
        showCustomSnackBar(
            message: res['message'], color: Colors.red, isTop: true);
        Get.toNamed(Routes.LOGIN);
      }
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Something went wrong',
      ));
    }
  }
}
