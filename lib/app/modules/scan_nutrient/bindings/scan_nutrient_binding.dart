import 'package:get/get.dart';

import '../controllers/scan_nutrient_controller.dart';

class ScanNutrientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanNutrientController>(
      () => ScanNutrientController(),
    );
  }
}
