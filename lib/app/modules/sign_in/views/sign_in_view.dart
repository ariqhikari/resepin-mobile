import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
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
                        "Welcome Back!",
                        style: boldInterFontStyle.copyWith(
                          color: yellowColor,
                          fontSize: 64,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 4),
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
                                text: "Sign In",
                                onTap: () async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    await controller.login();
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
                            'Dont have an account?',
                            style: semiBoldInterFontStyle.copyWith(
                                color: whiteColor),
                          ),
                          Gap.w4,
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.SIGN_UP);
                            },
                            child: Text(
                              'Register',
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
