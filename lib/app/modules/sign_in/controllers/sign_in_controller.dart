import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:resepin/app/data/data.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/services/services.dart';
import 'package:resepin/app/shared/shared.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  final Rx<User?> user = Rx<User?>(null);

  Future<void> login() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    ApiReturnValue<User> result = await AuthServices.signIn(
      emailController.text,
      passwordController.text,
    );

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    user.value = result.value;

    final box = GetStorage();
    await box.write('user', {
      'name': user.value!.name,
    });

    Get.offAndToNamed(Routes.MAIN);
    showSnackBar("Login success!", status: "Success");
  }
}
