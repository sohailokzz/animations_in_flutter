import 'package:flutter/material.dart';
import 'dart:math' as math;

class TweenColorAnimation extends StatefulWidget {
  const TweenColorAnimation({super.key});

  @override
  State<TweenColorAnimation> createState() => _TweenColorAnimationState();
}

class _TweenColorAnimationState extends State<TweenColorAnimation> {
  var _color = getColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const CircularClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: getColors(),
              end: _color,
            ),
            onEnd: () {
              setState(() {
                _color = getColors();
              });
            },
            duration: const Duration(seconds: 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.red,
            ),
            builder: (
              context,
              Color? color,
              child,
            ) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcATop,
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CircularClipper extends CustomClipper<Path> {
  const CircularClipper();
  @override
  Path getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius: size.width / 2,
    );

    path.addOval(rect);

    return path;
  }

  @override
  bool shouldReclip(
    CustomClipper<Path> oldClipper,
  ) =>
      false;
}

Color getColors() => Color(
      0xFF000000 +
          math.Random().nextInt(
            0x00FFFFFF,
          ),
    );
