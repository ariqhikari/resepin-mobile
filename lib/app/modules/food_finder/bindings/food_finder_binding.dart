import 'package:get/get.dart';

import '../controllers/food_finder_controller.dart';

class FoodFinderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodFinderController>(
      () => FoodFinderController(),
    );
  }
}
