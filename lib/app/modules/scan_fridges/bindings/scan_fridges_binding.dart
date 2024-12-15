import 'package:get/get.dart';

import '../controllers/scan_fridges_controller.dart';

class ScanFridgesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanFridgesController>(
      () => ScanFridgesController(),
    );
  }
}
