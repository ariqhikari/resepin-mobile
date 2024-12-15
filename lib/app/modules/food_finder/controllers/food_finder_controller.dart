import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resepin/app/modules/food_finder/views/food_finder_view.dart';
import 'package:resepin/app/routes/app_pages.dart';

class FoodFinderController extends GetxController {
  // Properties to observe
  var imagePath = ''.obs;
  var imageFile = Rx<XFile?>(null);

  // General function to pick image from either camera or gallery
  Future<void> onPickImage(FoodFinderType type, ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: source,
    );

    if (pickedFile != null) {
      imageFile.value = pickedFile;
      imagePath.value = pickedFile.path;

      switch (type) {
        case FoodFinderType.ingredients:
          Get.toNamed(
            Routes.SCAN_INGREDIENTS,
            arguments: {
              'imageFile': pickedFile,
              'imagePath': pickedFile.path,
            },
          );
          break;
        case FoodFinderType.fridges:
          Get.toNamed(
            Routes.SCAN_FRIDGES,
            arguments: {
              'imageFile': pickedFile,
              'imagePath': pickedFile.path,
            },
          );
          break;
        case FoodFinderType.nutrient:
          Get.toNamed(
            Routes.SCAN_NUTRIENT,
            arguments: {
              'imageFile': pickedFile,
              'imagePath': pickedFile.path,
            },
          );
          break;
        default:
          break;
      }
    }
  }

  // Function to handle camera view
  Future<void> onCameraView(FoodFinderType type) async {
    await onPickImage(type, ImageSource.camera);
  }

  // Function to handle gallery view
  Future<void> onGalleryView(FoodFinderType type) async {
    await onPickImage(type, ImageSource.gallery);
  }
}
