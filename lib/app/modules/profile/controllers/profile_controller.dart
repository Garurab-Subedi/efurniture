import 'package:furniture/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  // Function to handle logout
  void logout() {
    // Perform logout actions here, such as clearing user data, navigating to the login page, etc.
    // For example:
    // 1. Clear user data (if any)
    // UserData.clear();

    // 2. Navigate to the login page
    Get.toNamed(Routes
        .LOGIN); // Navigate to the login page and remove all previous routes
  }
}
