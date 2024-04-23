import 'package:flutter/material.dart';
import 'package:furniture/app/components/my_button.dart';
import 'package:furniture/app/components/my_textfield.dart';
import 'package:furniture/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);

  final signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            // key: controller.signUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  children: [
                    Text(
                      "Register yourself:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: controller.nameController,
                  hintText: 'Enter username',
                  labelText: 'User name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name can't be empty";
                    }
                    return null;
                  },
                ),
                MyTextField(
                  controller: controller.emailController,
                  hintText: 'Enter your Email',
                  labelText: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email can't be empty";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Give proper email address";
                    }
                    return null;
                  },
                ),
                MyTextField(
                  controller: controller.phonenumberController,
                  hintText: 'Enter your Phone number',
                  labelText: 'Phone-Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phonenumber can't be empty";
                    } else if (!GetUtils.isPhoneNumber(value)) {
                      return "Give proper Phone number";
                    }
                    return null;
                  },
                ),
                MyTextField(
                  controller: controller.addressController,
                  hintText: 'Enter your Address',
                  labelText: 'Address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Address can't be empty";
                    }
                    return null;
                  },
                ),
                MyTextField(
                  controller: controller.passwordController,
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                ),
                // MyDropdownField(
                //   controller: controller.genderController,
                //   hintText: 'Select Gender',
                //   labelText: 'Gender',
                //   items: ['Male', 'Female', 'Other'] // List of gender options
                //       .map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return "Gender can't be empty";
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                    title: 'Register', onPressed: () => controller.signUp()),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.LOGIN);
                        // Get.offAndToNamed(Routes.LOGIN);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class MyDropdownField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final List<DropdownMenuItem<String>> items;
  final String? Function(String?)? validator;

  const MyDropdownField({
    Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    required this.items,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: items,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: validator,
      onChanged: (_) {}, // Add an empty onChanged to avoid error
    );
  }
}
