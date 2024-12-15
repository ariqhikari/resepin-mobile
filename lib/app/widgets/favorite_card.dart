part of 'widgets.dart';

class FavoriteCard extends StatelessWidget {
  final Menu menu;

  const FavoriteCard({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.RESULT_INGREDIENTS);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [defaultBoxShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset("assets/images/creation_example.png"),
                ),
                Gap.w12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        menu.name,
                        style: semiBoldInterFontStyle,
                      ),
                    ),
                    Gap.h8,
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/ic_time.svg",
                              width: 12,
                            ),
                            Gap.w4,
                            Text(
                              "3 day ago",
                              style:
                                  regularInterFontStyle.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                        Gap.w8,
                        Text(
                          "${menu.ingredients.length} ingredients",
                          style: regularInterFontStyle.copyWith(fontSize: 10),
                        ),
                        Gap.w8,
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/ic_kcal.svg",
                              width: 12,
                            ),
                            Gap.w4,
                            Text(
                              "${menu.nutrient.calories}kcal",
                              style:
                                  regularInterFontStyle.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            menu.isFavorite
                ? SvgPicture.asset("assets/icons/ic_favorite_fill.svg")
                : SvgPicture.asset("assets/icons/ic_favorite.svg"),
          ],
        ),
      ),
    );
  }
}
