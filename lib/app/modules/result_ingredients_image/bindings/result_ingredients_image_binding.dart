import 'package:get/get.dart';

import '../controllers/result_ingredients_image_controller.dart';

class ResultIngredientsImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultIngredientsImageController>(
      () => ResultIngredientsImageController(),
    );
  }
}
