import 'package:get/get.dart';

import '../controllers/homedetails_controller.dart';

class HomedetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomedetailsController>(
      () => HomedetailsController(),
    );
  }
}
