part of 'widgets.dart';

class ButtonCircle extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Function onTap;
  final Color? color;

  const ButtonCircle({
    super.key,
    this.width = 50,
    this.height = 50,
    required this.child,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: Material(
        color: color ?? yellowColor,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            onTap();
          },
          child: Center(child: child),
        ),
      ),
    );
  }
}
