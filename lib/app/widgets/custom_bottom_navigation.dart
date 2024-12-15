part of 'widgets.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavigation({
    super.key,
    this.selectedIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: '000000'.toColor().withOpacity(.05),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, -1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // * Home
                GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap!(0);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // * Icon
                        SvgPicture.asset(
                          (selectedIndex == 0)
                              ? 'assets/icons/ic_home.svg'
                              : 'assets/icons/ic_home_normal.svg',
                          width: 20,
                          height: 20,
                        ),
                        Gap.h4,
                        // * Title
                        SizedBox(
                          width: 95,
                          child: Text(
                            'Home',
                            style: regularInterFontStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // * Food Finder
                GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap!(1);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // * Icon
                        SvgPicture.asset(
                          (selectedIndex == 1)
                              ? 'assets/icons/ic_food_finder.svg'
                              : 'assets/icons/ic_food_finder_normal.svg',
                          width: 20,
                          height: 20,
                        ),
                        Gap.h4,
                        // * Title
                        SizedBox(
                          width: 95,
                          child: Text(
                            'Food Finder',
                            style: regularInterFontStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // * Favorite
                GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap!(2);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // * Icon
                        SvgPicture.asset(
                          (selectedIndex == 2)
                              ? 'assets/icons/ic_favorite.svg'
                              : 'assets/icons/ic_favorite_normal.svg',
                          width: 20,
                          height: 20,
                        ),
                        Gap.h4,
                        // * Title
                        SizedBox(
                          width: 95,
                          child: Text(
                            'Favorite',
                            style: regularInterFontStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // * Profile
                GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap!(3);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // * Icon
                        Image.asset(
                          (selectedIndex == 3)
                              ? 'assets/icons/ic_profile.png'
                              : 'assets/icons/ic_profile_normal.png',
                          width: 20,
                          height: 20,
                        ),
                        Gap.h4,
                        // * Title
                        SizedBox(
                          width: 95,
                          child: Text(
                            'Profile',
                            style: regularInterFontStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 30),
        //   child: Center(
        //     child: ButtonCircle(
        //       onTap: () {},
        //       child: SvgPicture.asset("assets/icons/ic_chat.svg"),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
