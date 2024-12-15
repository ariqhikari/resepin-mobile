part of 'widgets.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: '00000080'.toColor(),
      child: Center(
        child: Container(
          width: 66,
          height: 66,
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(8)),
          child: makeLoadingIndicator(color: yellowColor),
        ),
      ),
    );
  }
}
