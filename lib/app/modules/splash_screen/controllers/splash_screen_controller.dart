import 'package:get/get.dart';
import 'package:resepin/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  moveToMain() {
    Future.delayed(const Duration(seconds: 3), () async {
      Get.offAllNamed(Routes.SIGN_IN);
    });
  }
}
