import 'dart:io';

import 'package:get/get.dart';

class ResultNutrientController extends GetxController {
  List<String> nutrient = [];
  File? image;

  @override
  void onInit() {
    super.onInit();

    // Mengambil argumen dari Get.arguments
    final arguments = Get.arguments;

    if (arguments is Map<String, dynamic>) {
      if (arguments['nutrient'] is List<String>) {
        nutrient = arguments['nutrient'];
      }

      if (arguments['image'] is File) {
        image = arguments['image'];
      }
    }
  }
}
