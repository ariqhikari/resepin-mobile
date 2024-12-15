part of 'widgets.dart';

class ModalBottomSheet extends StatelessWidget {
  final String? title;
  final Widget content;

  const ModalBottomSheet({
    super.key,
    required this.content,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        title != null
            ? Container(
                padding: EdgeInsets.only(
                  top: 16,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: [
                    Text(
                      title!,
                      style: mediumInterFontStyle.copyWith(color: yellowColor),
                    ),
                    Gap.h40,
                    content,
                    Gap.h40,
                  ],
                ),
              )
            : content,
      ],
    );
  }
}
