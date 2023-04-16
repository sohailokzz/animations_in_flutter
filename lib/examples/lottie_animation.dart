import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animations/building_animation.json',
            controller: animationController,
            onLoaded: (composition) {
              animationController
                ..duration = composition.duration
                ..forward();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => animationController.stop(),
                child: const Text('Pause'),
              ),
              ElevatedButton(
                onPressed: () => animationController.forward(),
                child: const Text('Forward'),
              ),
              ElevatedButton(
                onPressed: () {
                  animationController.reset();
                  animationController.forward();
                },
                child: const Text('Repeat'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
