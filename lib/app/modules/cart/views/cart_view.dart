import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'package:furniture/app/utils/constants.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Your Cart'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.find<CartController>().clearCart();
              Get.snackbar('Success', 'Cart cleared');
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: GetBuilder<CartController>(
        builder: (controller) {
          if (controller.cartItems.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            // leading: Image.network(
                            //   item['productThumbnail'],
                            //   width: 80,
                            //   height: 80,
                            //   fit: BoxFit.cover,
                            // ),
                            title: Text(item['productName']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Price: Rs ${item['productPrice'] * item['quantity']}'),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.decreaseQuantity(index);
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text('${item['quantity']}'),
                                    IconButton(
                                      onPressed: () {
                                        controller.increaseQuantity(index);
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                            'Total: Rs ${controller.totalPrice}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      ElevatedButton(
                        onPressed: () {
                          // Implement checkout functionality
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
