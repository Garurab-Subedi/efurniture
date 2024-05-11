import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/orderdetails_controller.dart'; // Import the OrderdetailsController

class OrderdetailsView extends GetView<OrderdetailsController> {
  const OrderdetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderdetailsController()); // Instantiate OrderdetailsController

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.order.value.data != null) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order ID: ${controller.order.value.data!.id}'),
                  Text('User ID: ${controller.order.value.data!.userId}'),
                  Text(
                      'Reference ID: ${controller.order.value.data!.referenceId}'),
                  // Add more details as needed
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
