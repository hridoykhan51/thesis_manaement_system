import 'package:get/get.dart';

import '../controller/landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<LandingPageController>()) {
      Get.lazyPut<LandingPageController>(LandingPageController.new);
    }
  }
}
