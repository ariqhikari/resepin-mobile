part of 'widgets.dart';

class ButtonTransparent extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function? onTap;
  final BorderRadius? borderRadius;

  const ButtonTransparent({
    super.key,
    required this.child,
    this.onTap,
    this.color = Colors.transparent,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap != null ? () => onTap!() : null,
        child: child,
      ),
    );
  }
}
