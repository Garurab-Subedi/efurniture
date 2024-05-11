import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:furniture/app/routes/app_pages.dart';
import 'package:furniture/app/utils/constants.dart';
import 'package:furniture/app/utils/memory_management.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  late TextEditingController nameController,
      emailController,
      phonenumberController,
      addressController,
      passwordController;

  @override
  void onInit() {
    super.onInit();

    nameController = TextEditingController();
    emailController = TextEditingController();
    phonenumberController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phonenumberController.dispose();
    addressController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  void signUp() async {
    try {
      var response = await http.post(Uri.parse('$baseUrl/auth/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "name": nameController.text,
            "email": emailController.text,
            "phonenumber": phonenumberController.text,
            "address": addressController.text,
            "password": passwordController.text
          }));

      var res = await jsonDecode(response.body);
      if (res['status'] == 200) {
        // MemoryManagement.setAccessToken(res['token']);
        showCustomSnackBar(
            message: res['message'], color: Colors.green, isTop: true);
        Get.toNamed(Routes.LOGIN);
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
