part of 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            color: grayColor,
            height: 2,
          )),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Get.back();
        },
      ),
      title: title != null
          ? Text(
              title!,
              style: semiBoldInterFontStyle,
            )
          : null,
      centerTitle: true,
      actions: actions,
    );
  }

  // Tentukan ukuran preferensi AppBar (biasanya tinggi default AppBar adalah kToolbarHeight)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
