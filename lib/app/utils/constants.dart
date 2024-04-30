import 'package:flutter/material.dart';
import 'package:get/get.dart';

const ipAddress = "https://test12.hamropahal.org/api";

const baseUrl = ipAddress;
// Obtain shared preferences.

var getImageUrl = (productThumbnail) {
  return 'https://test12.hamropahal.org/uploads/images/product/$productThumbnail';
};

// .http://127.0.0.1:8000/uploads/images/product/d604b943fb988e8daed061e2b652a5bc.png

String getAvatar({required String name, Color? color}) {
  var splitName = name.split(' ');
  return 'http://ui-avatars.com/api/?name=${splitName.first.characters}&length=2&format=png&rounded=true&size=256&background=${color ?? '0096FF'}&color=${color ?? 'FFFFFF'}';
}

var showCustomSnackBar = (
        {required String message, Color? color, bool isTop = false}) =>
    Get.showSnackbar(GetSnackBar(
        messageText: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        // snackPosition: isCart ? SnackPosition.TOP : SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
        backgroundColor: color ?? Colors.red,
        snackPosition: isTop ? SnackPosition.TOP : SnackPosition.BOTTOM

        // backgroundColor: color ?? Colors.green,
        ));

const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
