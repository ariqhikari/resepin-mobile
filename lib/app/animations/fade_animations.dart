part of 'animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool isTranslate;

  const FadeAnimation({
    Key? key,
    this.delay = 1,
    this.isTranslate = true,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..scene(
        begin: const Duration(milliseconds: 0),
        end: defaultDuration,
      ).tween(
        AniProps.opacity,
        Tween<double>(begin: 0.0, end: 1.0),
      );

    if (isTranslate) {
      tween
          .scene(
            begin: const Duration(milliseconds: 0),
            end: defaultDuration,
          )
          .tween(
            AniProps.translateY,
            Tween<double>(begin: 100, end: 0.0),
            curve: Curves.easeOut,
          );
    } else {
      tween
          .scene(
            begin: const Duration(milliseconds: 0),
            end: defaultDuration,
          )
          .tween(
            AniProps.translateY,
            ConstantTween<double>(0.0),
          );
    }

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (350 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) {
        final opacity = value.get(AniProps.opacity);
        final translateY = value.get(AniProps.translateY);
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(0, translateY),
            child: child,
          ),
        );
      },
    );
  }
}
