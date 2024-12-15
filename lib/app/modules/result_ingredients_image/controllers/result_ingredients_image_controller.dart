import 'package:get/get.dart';
import 'package:resepin/app/data/data.dart';

class ResultIngredientsImageController extends GetxController {
  List<Menu> menu = [];

  @override
  void onInit() {
    super.onInit();

    // Mengambil argumen dari Get.arguments
    final arguments = Get.arguments;

    if (arguments is Map<String, dynamic>) {
      if (arguments['menu'] is List<Menu>) {
        menu = arguments['menu'];
      }
    }
  }
}
