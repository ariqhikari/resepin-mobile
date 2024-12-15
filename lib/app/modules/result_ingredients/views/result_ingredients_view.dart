import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/result_ingredients_controller.dart';

class ResultIngredientsView extends GetView<ResultIngredientsController> {
  const ResultIngredientsView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Result Scan"),
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: ListView(
            children: [
              Gap.h12,
              // * Header
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'With ',
                      style: semiBoldInterFontStyle.copyWith(fontSize: 24),
                    ),
                    TextSpan(
                      text: controller.ingredients.join(', '),
                      style: semiBoldInterFontStyle.copyWith(
                          color: yellowColor, fontSize: 24),
                    ),
                    TextSpan(
                        text: ' you can have....',
                        style: semiBoldInterFontStyle.copyWith(fontSize: 24)),
                  ],
                ),
              ),
              Gap.h24,
              for (var menu in controller.menu)
                Column(
                  children: [
                    ResultMenuCard(menu: menu),
                    Gap.h24,
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
