import 'package:get/get.dart';

import '../controllers/scan_ingredients_controller.dart';

class ScanIngredientsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanIngredientsController>(
      () => ScanIngredientsController(),
    );
  }
}
