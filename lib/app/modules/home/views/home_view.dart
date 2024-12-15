import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:resepin/app/modules/main/controllers/main_controller.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  final mainController = Get.put(MainController());
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: ListView(
        children: [
          Gap.h24,
          // * Header
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hello,',
                  style: boldInterFontStyle.copyWith(fontSize: 42),
                ),
                TextSpan(
                  text: 'Yunia',
                  style: boldInterFontStyle.copyWith(
                      color: yellowColor, fontSize: 42),
                ),
                TextSpan(
                    text: '!',
                    style: boldInterFontStyle.copyWith(fontSize: 42)),
              ],
            ),
          ),
          Gap.h16,
          // * Search
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'What ingredients do you have?, ',
                  style: boldInterFontStyle,
                ),
                TextSpan(
                  text: 'Today?',
                  style: boldInterFontStyle.copyWith(color: yellowColor),
                ),
              ],
            ),
          ),
          Gap.h12,
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: mainController.ingredientController,
                  decoration: InputDecoration(
                    hintText: 'Write down the materials...',
                    hintStyle: mediumInterFontStyle.copyWith(color: inputColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightYellowColor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightYellowColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: lightYellowColor, width: 1),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: yellowColor),
                      onPressed: mainController.getMenuByIngredient,
                    ),
                  ),
                  onSubmitted: (_) {
                    mainController.addIngredient();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(() {
            return Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: mainController.ingredients
                  .map((ingredient) => Chip(
                        label: Text(ingredient,
                            style: regularInterFontStyle.copyWith(
                                color: whiteColor)),
                        backgroundColor: lightYellowColor,
                        onDeleted: () =>
                            mainController.removeIngredient(ingredient),
                        deleteIconColor: whiteColor,
                        shape: null,
                      ))
                  .toList(),
            );
          }),
          Gap.h12,
          // * Challenges
          Container(
            decoration: BoxDecoration(
              color: lightYellowColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/images/illustration_meal.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Take Challenges with Resepin",
                        style: semiBoldInterFontStyle.copyWith(
                            color: whiteColor, fontSize: 20),
                      ),
                      Gap.h12,
                      Text(
                        '"Make Your Cooking More Unique by\nUsing Existing Kitchen Ingredients and\nAI Recommendations!"',
                        style:
                            regularInterFontStyle.copyWith(color: whiteColor),
                      ),
                      Gap.h12,
                      SizedBox(
                        width: 125,
                        child: Button(text: "Challenges", onTap: () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap.h32,
          // * Your Creations
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Your ',
                  style: boldInterFontStyle.copyWith(fontSize: 21),
                ),
                TextSpan(
                  text: 'Creations',
                  style: boldInterFontStyle.copyWith(
                      color: yellowColor, fontSize: 21),
                ),
              ],
            ),
          ),
          Gap.h12,
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: mainController.menuCreations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: MenuCard(menu: mainController.menuCreations[index]),
                );
              },
            ),
          ),
          Gap.h24,
          // * Meal Plan
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Meal ',
                  style: boldInterFontStyle.copyWith(fontSize: 21),
                ),
                TextSpan(
                  text: 'Plan',
                  style: boldInterFontStyle.copyWith(
                      color: yellowColor, fontSize: 21),
                ),
              ],
            ),
          ),
          Gap.h12,
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: mainController.menuPlan.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: MenuCard(menu: mainController.menuPlan[index]),
                );
              },
            ),
          ),
          Gap.h120,
        ],
      ),
    );
  }
}
