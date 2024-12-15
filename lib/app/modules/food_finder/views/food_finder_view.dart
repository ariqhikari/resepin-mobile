import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:resepin/app/routes/app_pages.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/food_finder_controller.dart';

enum FoodFinderType { ingredients, fridges, nutrient }

class FoodFinderView extends GetView<FoodFinderController> {
  const FoodFinderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: ListView(
        children: [
          Gap.h12,
          // * Header
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Food ',
                  style: boldInterFontStyle.copyWith(fontSize: 42),
                ),
                TextSpan(
                  text: 'Finder',
                  style: boldInterFontStyle.copyWith(
                      color: yellowColor, fontSize: 42),
                ),
              ],
            ),
          ),
          Gap.h12,
          Container(
            decoration: BoxDecoration(
              color: lightYellowColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 12,
                  child: Image.asset("assets/images/illustration_recipe.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 21,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Food Finder with Resepin",
                        style: semiBoldInterFontStyle.copyWith(
                            color: whiteColor, fontSize: 20),
                      ),
                      Gap.h12,
                      Text(
                        '"Make Cooking Easier! Scan ingredients,\npackaging, or your refrigerator, and let\nAI inspire recipes and help manage\nleftovers"',
                        style: regularInterFontStyle.copyWith(
                            color: whiteColor, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap.h24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  boxShadow: [defaultBoxShadow],
                ),
                child: ButtonTransparent(
                  color: lightYellowColor,
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    showImagePicker(context, FoodFinderType.ingredients);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: [
                        Image.asset(
                            "assets/images/illustration_scan_ingredients.png"),
                        Gap.h4,
                        Text(
                          "Scan Ingredients",
                          textAlign: TextAlign.center,
                          style: semiBoldInterFontStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  boxShadow: [defaultBoxShadow],
                ),
                child: ButtonTransparent(
                  color: lightYellowColor,
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    showImagePicker(context, FoodFinderType.fridges);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: [
                        Image.asset("assets/images/illustration_fridges.png"),
                        Gap.h4,
                        Text(
                          "Scan Fridges",
                          textAlign: TextAlign.center,
                          style: semiBoldInterFontStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap.h16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  boxShadow: [defaultBoxShadow],
                ),
                child: ButtonTransparent(
                  color: lightYellowColor,
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    showImagePicker(context, FoodFinderType.nutrient);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: [
                        Image.asset(
                            "assets/images/illustration_scan_code_food.png"),
                        Gap.h4,
                        Text(
                          "Scan Nutrient Facts",
                          textAlign: TextAlign.center,
                          style: semiBoldInterFontStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showImagePicker(
    BuildContext context,
    FoodFinderType type,
  ) {
    final FoodFinderController controller = Get.put(FoodFinderController());
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 23,
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    controller.onCameraView(type);
                    Navigator.pop(context);
                  },
                  customBorder: const CircleBorder(),
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/icons/ic_camera.svg"),
                      const SizedBox(height: 10),
                      Text(
                        'Camera',
                        style: semiBoldInterFontStyle,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.onGalleryView(type);
                    Navigator.pop(context);
                  },
                  customBorder: const CircleBorder(),
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/icons/ic_gallery.svg"),
                      const SizedBox(height: 10),
                      Text(
                        'Gallery',
                        style: semiBoldInterFontStyle,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
