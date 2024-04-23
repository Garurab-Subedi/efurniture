import 'package:furniture/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:furniture/app/model/product.dart';

class HomeController extends GetxController {
  final products = <Datum>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    final url = Uri.parse('$baseUrl/auth/gethomepage');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<Datum> fetchedProducts =
            productFromJson(response.body).data!;
        for (var product in fetchedProducts) {
          // Construct the product thumbnail URL
          product.productThumbnail =
              "https://example.com/images/products/${product.productId}.jpg";
        }
        products.assignAll(fetchedProducts);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
