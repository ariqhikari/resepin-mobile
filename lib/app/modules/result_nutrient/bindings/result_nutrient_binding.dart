import 'package:get/get.dart';

import '../controllers/result_nutrient_controller.dart';

class ResultNutrientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultNutrientController>(
      () => ResultNutrientController(),
    );
  }
}
