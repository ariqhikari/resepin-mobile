import 'package:get/get.dart';
import 'package:resepin/app/data/data.dart';

class ResultIngredientsController extends GetxController {
  List<Menu> menu = [];
  List<String> ingredients = [];

  @override
  void onInit() {
    super.onInit();

    // Mengambil argumen dari Get.arguments
    final arguments = Get.arguments;

    if (arguments is Map<String, dynamic>) {
      if (arguments['menu'] is List<Menu>) {
        menu = arguments['menu'];
      }

      if (arguments['ingredients'] is List<String>) {
        ingredients = arguments['ingredients'];
      }
    }
  }
}
