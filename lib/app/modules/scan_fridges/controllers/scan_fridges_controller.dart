import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resepin/app/data/data.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/services/services.dart';
import 'package:resepin/app/shared/shared.dart';

class ScanFridgesController extends GetxController {
  String? imagePath;
  XFile? imageFile;
  File? imageShow;

  @override
  void onInit() {
    // Mengambil argumen dari Get.arguments
    final arguments = Get.arguments;

    if (arguments is Map<String, dynamic>) {
      imageFile = arguments['imageFile'] as XFile?;
      imagePath = arguments['imagePath'] as String?;

      imageShow = File(imagePath!);
    }

    super.onInit();
  }

  moveToResult() async {
    ApiReturnValue<List<Menu>> result = await MenuServices.getMenuByFridges(
      type: IngredientType.text,
      image: imageShow,
    );

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    Get.offAndToNamed(
      Routes.RESULT_FRIDGES,
      arguments: {
        'menu': result.value,
      },
    );
  }
}
