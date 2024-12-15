import 'package:get/get.dart';

import '../controllers/result_fridges_controller.dart';

class ResultFridgesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultFridgesController>(
      () => ResultFridgesController(),
    );
  }
}
