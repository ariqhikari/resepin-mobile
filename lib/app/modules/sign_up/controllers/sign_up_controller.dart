import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepin/app/data/data.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/services/services.dart';
import 'package:resepin/app/shared/shared.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    ApiReturnValue<User> result = await AuthServices.signUp(
      nameController.text,
      emailController.text,
      passwordController.text,
    );

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    Get.offAndToNamed(Routes.SIGN_IN);
    showSnackBar("Register success!", status: "Success");
  }
}
