import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void addToCart(Map<String, dynamic> product) {
    int index = cartItems
        .indexWhere((item) => item['productId'] == product['productId']);

    if (index != -1) {
      cartItems[index]['quantity'] += 1;
    } else {
      cartItems.add({
        'productId': product['productId'],
        'productName': product['productName'],
        'productPrice': double.parse(product['productPrice'].toString()),
        'productThumbnail': product['productThumbnail'],
        'quantity': 1,
      });
    }
    updateTotalPrice();
    updateTotalItems();
  }

  void removeFromCart(int productId) {
    cartItems.removeWhere((item) => item['productId'] == productId);
    updateTotalPrice();
    updateTotalItems();
  }

  void clearCart() {
    cartItems.clear();
    updateTotalPrice();
    updateTotalItems();
  }

  void updateTotalItems() {
    totalItems.value =
        cartItems.fold<int>(0, (sum, item) => sum + item['quantity'] as int);
  }

  void updateTotalPrice() {
    totalPrice.value = cartItems.fold<double>(
      0,
      (sum, item) => sum + (item['productPrice'] * item['quantity']),
    );
  }

  void increaseQuantity(int index) {
    cartItems[index]['quantity'] += 1;
    updateTotalPrice();
    updateTotalItems();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity'] -= 1;
      updateTotalPrice();
      updateTotalItems();
    }
  }
}
