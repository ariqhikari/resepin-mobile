part of 'widgets.dart';

class OutlineButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final bool isDisabled;
  final double? width;

  const OutlineButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.width,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 50,
      child: ButtonTransparent(
        borderRadius: BorderRadius.circular(100),
        onTap: !isDisabled ? () => onTap() : null,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: grayColor, width: 1),
            borderRadius: BorderRadius.circular(100),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
