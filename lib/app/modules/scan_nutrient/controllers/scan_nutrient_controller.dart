import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resepin/app/data/data.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/services/services.dart';
import 'package:resepin/app/shared/shared.dart';

class ScanNutrientController extends GetxController {
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
    ApiReturnValue<List<String>> result =
        await MenuServices.getNutrientFacts(imageShow!);

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    Get.offAndToNamed(
      Routes.RESULT_NUTRIENT,
      arguments: {
        'image': imageShow,
        'nutrient': result.value,
      },
    );
  }
}
