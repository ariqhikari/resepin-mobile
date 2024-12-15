import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/result_ingredients_image_controller.dart';

class ResultIngredientsImageView
    extends GetView<ResultIngredientsImageController> {
  const ResultIngredientsImageView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Result Menu"),
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: ListView(
            children: [
              Gap.h12,
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
