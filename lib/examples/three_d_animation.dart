import 'dart:math' show pi;
import 'package:animation_in_flutter/spacing.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ThreeDAnimation extends StatefulWidget {
  const ThreeDAnimation({super.key});

  @override
  State<ThreeDAnimation> createState() => _ThreeDAnimationState();
}

class _ThreeDAnimationState extends State<ThreeDAnimation>
    with TickerProviderStateMixin {
  static const widthAndHeight = 100.0;

  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 20,
      ),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 30,
      ),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 40,
      ),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi / 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('3D Animation'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            widthAndHeight.ph,
            double.infinity.pw,
            AnimatedBuilder(
              animation: Listenable.merge([
                _xController,
                _yController,
                _zController,
              ]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      //back side
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(
                            Vector3(0, 0, -widthAndHeight),
                          ),
                        child: Container(
                          color: Colors.purple,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),

                      //left side
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2.0),
                        child: Container(
                          color: Colors.red,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                      //right side
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2.0),
                        child: Container(
                          color: Colors.blue,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),

                      //front
                      Container(
                        color: Colors.green,
                        height: widthAndHeight,
                        width: widthAndHeight,
                      ),
                      //top side
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2.0),
                        child: Container(
                          color: Colors.orange,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                      //bottom side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2.0),
                        child: Container(
                          color: Colors.brown,
                          height: widthAndHeight,
                          width: widthAndHeight,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
