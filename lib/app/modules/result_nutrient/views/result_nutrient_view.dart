import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/result_nutrient_controller.dart';

class ResultNutrientView extends GetView<ResultNutrientController> {
  const ResultNutrientView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Result Nutrition Fact"),
        backgroundColor: whiteColor,
        body: ListView(
          children: [
            controller.image != null
                ? Image.file(
                    controller.image!,
                    fit: BoxFit.fill,
                  )
                : const Text('No image available'),
            Gap.h12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The ingredients in your food:",
                    style: semiBoldInterFontStyle,
                  ),
                  Gap.h12,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: yellowColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var ingredient in controller.nutrient)
                          Text(
                            "• $ingredient",
                            style: const TextStyle(fontSize: 16),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap.h52,
          ],
        ),
      ),
    );
  }
}
