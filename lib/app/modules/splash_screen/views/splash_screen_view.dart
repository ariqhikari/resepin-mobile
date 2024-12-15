import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resepin/app/animations/animations.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        body: FutureBuilder(
            future: controller.moveToMain(),
            builder: (context, _) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Resep',
                            style: boldInterFontStyle.copyWith(
                                color: yellowColor, fontSize: 48),
                          ),
                          TextSpan(
                              text: 'in.',
                              style: boldInterFontStyle.copyWith(fontSize: 48)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    FadeAnimation(
                      isTranslate: false,
                      delay: 3,
                      child: Text(
                        "Use Leftover Ingredients, Get Inspired, Delicious Creations Come to Life!",
                        textAlign: TextAlign.center,
                        style: boldInterFontStyle.copyWith(color: yellowColor),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
