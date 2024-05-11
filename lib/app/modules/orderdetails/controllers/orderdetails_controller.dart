// OrderController
import 'package:furniture/app/model/order.dart';
import 'package:furniture/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderdetailsController extends GetxController {
  final order = Order().obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrderDetails(); // Fetch order details when the controller is initialized
  }

  Future<void> fetchOrderDetails() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/auth/order-details'));
      if (response.statusCode == 200) {
        // Parse the response JSON and assign it to the 'order' variable
        order.value = orderFromJson(response.body);
      } else {
        throw Exception('Failed to fetch order details');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
