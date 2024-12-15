import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepin/app/modules/main/controllers/main_controller.dart';

import 'package:resepin/app/shared/shared.dart';
import 'package:resepin/app/widgets/widgets.dart';

class FavoriteView extends StatelessWidget {
  final mainController = Get.put(MainController());
  FavoriteView({super.key});
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
                  text: 'Your ',
                  style: boldInterFontStyle.copyWith(fontSize: 42),
                ),
                TextSpan(
                  text: 'Favorites',
                  style: boldInterFontStyle.copyWith(
                      color: yellowColor, fontSize: 42),
                ),
              ],
            ),
          ),
          Gap.h12,
          for (var menu in mainController.menuFavorite)
            Column(
              children: [
                FavoriteCard(menu: menu),
                Gap.h12,
              ],
            ),
          Gap.h120,
        ],
      ),
    );
  }
}
