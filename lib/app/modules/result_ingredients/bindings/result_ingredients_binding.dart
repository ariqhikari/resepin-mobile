import 'package:get/get.dart';

import '../controllers/result_ingredients_controller.dart';

class ResultIngredientsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultIngredientsController>(
      () => ResultIngredientsController(),
    );
  }
}
