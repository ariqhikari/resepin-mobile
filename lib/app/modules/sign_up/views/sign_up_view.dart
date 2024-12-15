import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                "assets/images/bg_auth.svg",
                width: double.infinity,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 6),
                      Text(
                        "Create Account!",
                        style: boldInterFontStyle.copyWith(
                          color: yellowColor,
                          fontSize: 64,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 5),
                      InputText(
                        controller: controller.nameController,
                        hint: "Enter name",
                        icon: 'assets/icons/ic_user.svg',
                      ),
                      Gap.h24,
                      InputText(
                        controller: controller.emailController,
                        hint: "Enter email",
                        icon: 'assets/icons/ic_email.svg',
                      ),
                      Gap.h24,
                      InputPassword(
                        controller: controller.passwordController,
                        hint: "Enter password",
                      ),
                      Gap.h40,
                      Obx(
                        () => controller.isLoading.value == true
                            ? makeLoadingIndicator()
                            : Button(
                                text: "Sign Up",
                                onTap: () async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    await controller.register();
                                  }
                                },
                                buttonStyle: makeButton(whiteColor,
                                    textColor: yellowColor),
                              ),
                      ),
                      Gap.h14,
                      // * Move to register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You have an account?',
                            style: semiBoldInterFontStyle.copyWith(
                                color: whiteColor),
                          ),
                          Gap.w4,
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              'Login',
                              style: semiBoldInterFontStyle.copyWith(
                                color: blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap.h52,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
