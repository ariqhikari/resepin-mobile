import 'package:get/get.dart';

import '../modules/challenges/bindings/challenges_binding.dart';
import '../modules/challenges/views/challenges_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/result_fridges/bindings/result_fridges_binding.dart';
import '../modules/result_fridges/views/result_fridges_view.dart';
import '../modules/result_ingredients/bindings/result_ingredients_binding.dart';
import '../modules/result_ingredients/views/result_ingredients_view.dart';
import '../modules/result_ingredients_image/bindings/result_ingredients_image_binding.dart';
import '../modules/result_ingredients_image/views/result_ingredients_image_view.dart';
import '../modules/result_nutrient/bindings/result_nutrient_binding.dart';
import '../modules/result_nutrient/views/result_nutrient_view.dart';
import '../modules/scan_fridges/bindings/scan_fridges_binding.dart';
import '../modules/scan_fridges/views/scan_fridges_view.dart';
import '../modules/scan_ingredients/bindings/scan_ingredients_binding.dart';
import '../modules/scan_ingredients/views/scan_ingredients_view.dart';
import '../modules/scan_nutrient/bindings/scan_nutrient_binding.dart';
import '../modules/scan_nutrient/views/scan_nutrient_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_INGREDIENTS,
      page: () => const ResultIngredientsView(),
      binding: ResultIngredientsBinding(),
    ),
    GetPage(
      name: _Paths.CHALLENGES,
      page: () => const ChallengesView(),
      binding: ChallengesBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_INGREDIENTS,
      page: () => const ScanIngredientsView(),
      binding: ScanIngredientsBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_INGREDIENTS_IMAGE,
      page: () => const ResultIngredientsImageView(),
      binding: ResultIngredientsImageBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_NUTRIENT,
      page: () => const ScanNutrientView(),
      binding: ScanNutrientBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_NUTRIENT,
      page: () => const ResultNutrientView(),
      binding: ResultNutrientBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_FRIDGES,
      page: () => const ScanFridgesView(),
      binding: ScanFridgesBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_FRIDGES,
      page: () => const ResultFridgesView(),
      binding: ResultFridgesBinding(),
    ),
  ];
}
