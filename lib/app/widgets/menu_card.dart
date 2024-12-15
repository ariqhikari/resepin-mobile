part of 'widgets.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;

  const MenuCard({
    super.key,
    required this.menu, // Accepting Menu model as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.RESULT_INGREDIENTS, arguments: menu);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [defaultBoxShadow],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Displaying the image for the Menu, could be changed if you have an image URL in the model
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
                    menu.name, // Using the name from the Menu model
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
                          "3 day ago", // You might want to replace this with actual date info from the model
                          style: regularInterFontStyle.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                    Gap.w8,
                    Text(
                      "${menu.ingredients.length} ingredients", // Using the ingredients count from the Menu model
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
                          "${menu.nutrient.calories} kcal", // Using calories from the Nutrient model
                          style: regularInterFontStyle.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
