import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture/app/model/product.dart';
import 'package:furniture/app/modules/cart/controllers/cart_controller.dart';
import 'package:furniture/app/modules/cart/views/cart_view.dart';
import 'package:furniture/app/modules/homedetails/controllers/homedetails_controller.dart';
import 'package:furniture/app/utils/constants.dart';
import 'package:get/get.dart';

class HomedetailsView extends GetView<HomedetailsController> {
  final Datum product;

  const HomedetailsView(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/back.svg"),
        ),
        centerTitle: false,
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Get.to(const CartView());
                },
                icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
              ),
              Obx(
                () {
                  final cartController = Get.find<CartController>();
                  return cartController.cartItems.isNotEmpty
                      ? Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              cartController.cartItems.length.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container();
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    height: size.width * 0.8,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: size.width * 0.7,
                          width: size.width * 0.7,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Image.asset(
                          "assets/images/Item_2.png",
                          height: size.width * 0.75,
                          width: size.width * 0.75,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: Text(
                          product.productName ?? "",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Text(
                        'Price: Rs ${product.productPrice}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: Text(
                          product.productLongDescription ?? "",
                          style: const TextStyle(color: kTextLightColor),
                        ),
                      ),
                      Text(
                        "Quantity: ${product.productQuantity}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        "Status: ${product.productStatus}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        "Brand: ${product.brandId}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        "Vendor: ${product.vendorId}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        product.productShortDescription ?? "",
                        style: const TextStyle(color: kTextLightColor),
                      ),
                      const SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                final Map<String, dynamic> cartProduct = {
                  'productId': product.productId,
                  'productName': product.productName,
                  'productPrice': product.productPrice,
                  'productThumbnail': product.productThumbnail,
                };
                Get.find<CartController>().addToCart(cartProduct);
                Get.snackbar('Success', 'Product added to cart');
              },
              child: Container(
                margin: const EdgeInsets.all(kDefaultPadding),
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFCBF1E),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/shopping-bag.svg",
                      height: 18,
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                    const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
