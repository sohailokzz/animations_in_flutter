import 'package:flutter/material.dart';

class ChainedAnimation extends StatefulWidget {
  const ChainedAnimation({super.key});

  @override
  State<ChainedAnimation> createState() => _ChainedAnimationState();
}

class _ChainedAnimationState extends State<ChainedAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chained Animation'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: HalfCircleClipper(
                circleSides: CircleSides.left,
              ),
              child: Container(
                color: const Color(0xff0057b7),
                width: 150,
                height: 150,
              ),
            ),
            ClipPath(
              clipper: HalfCircleClipper(
                circleSides: CircleSides.right,
              ),
              child: Container(
                color: const Color(0xffffd700),
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum CircleSides {
  left,
  right,
}

extension ToPath on CircleSides {
  Path toPath(Size size) {
    final path = Path();

    late Offset offset;
    late bool clockWise;

    switch (this) {
      case CircleSides.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockWise = false;
        break;
      case CircleSides.right:
        offset = Offset(0, size.height);
        clockWise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(
        size.width / 2,
        size.height / 2,
      ),
      clockwise: clockWise,
    );

    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSides circleSides;
  HalfCircleClipper({
    required this.circleSides,
  });
  @override
  Path getClip(Size size) => circleSides.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
