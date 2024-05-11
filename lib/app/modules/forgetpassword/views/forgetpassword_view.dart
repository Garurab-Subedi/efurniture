import 'package:flutter/material.dart';
import 'package:furniture/app/components/my_button.dart';
import 'package:furniture/app/components/my_textfield.dart';

import 'package:get/get.dart';

import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  const ForgetpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          // key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                MyTextField(
                  // controller: controller.oldPasswordController,
                  isPassword: true,
                  labelText: 'Old Password',
                  hintText: 'Enter old password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter old password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  // controller: controller.newPasswordController,
                  isPassword: true,
                  labelText: 'New Password',
                  hintText: 'Enter new password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter new password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  // controller: controller.confirmPasswordController,
                  isPassword: true,
                  labelText: 'Confirm Password',
                  hintText: 'Enter confirm password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    if (value.isEmpty) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  title: 'Change Password',
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
