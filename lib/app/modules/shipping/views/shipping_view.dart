import 'package:flutter/material.dart';
import 'package:furniture/app/routes/app_pages.dart';
import 'package:furniture/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import '../controllers/shipping_controller.dart';

class ShippingView extends GetView<ShippingController> {
  const ShippingView({Key? key}) : super(key: key);

  int getAmt(int amount) {
    return amount * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShippingView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.orderTypeController,
              decoration: const InputDecoration(
                labelText: 'Order Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.referenceController,
              decoration: const InputDecoration(
                labelText: 'Reference ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                KhaltiScope.of(context).pay(
                  config: PaymentConfig(
                    amount: getAmt(10),
                    productIdentity: 'ev-point-gaurab',
                    productName: 'Product Name',
                  ),
                  preferences: [
                    PaymentPreference.khalti,
                    PaymentPreference.connectIPS
                  ],
                  onSuccess: (PaymentSuccessModel value) {
                    showCustomSnackBar(
                      message: 'Payment successful. Proceeding with booking...',
                    );
                    // After successful payment, call checkBooking method

                    Get.toNamed(Routes.ORDERDETAILS);
                  },
                  onFailure: (PaymentFailureModel value) {
                    showCustomSnackBar(
                      message: 'Payment failed. Please try again.',
                    );
                  },
                );
              },
              child: const Text('Pay with Khalti'),
            ),
          ],
        ),
      ),
    );
  }
}
