import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:resepin/app/modules/favorite/views/favorite_view.dart';
import 'package:resepin/app/modules/food_finder/views/food_finder_view.dart';
import 'package:resepin/app/modules/home/views/home_view.dart';
import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            // * Page View
            PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.selectedPage.value = index;
              },
              children: [
                // * Home Page
                HomeView(),
                // * Food Finder Page
                const FoodFinderView(),
                // * Favorite Page
                FavoriteView(),
              ],
            ),
            // * Bottom Navigation
            Obx(
              () => CustomBottomNavigation(
                selectedIndex: controller.selectedPage.value,
                onTap: (index) {
                  controller.selectedPage.value = index;
                  controller.pageController.animateToPage(
                    controller.selectedPage.value,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400),
                  );
                },
              ),
            ),
            // * Loading
            Obx(() {
              return controller.isLoading.value
                  ? const Loading()
                  : const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
