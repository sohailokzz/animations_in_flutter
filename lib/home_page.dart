import 'package:animation_in_flutter/spacing.dart';
import 'package:flutter/material.dart';

import 'routes/routes_name.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations in Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.heroanimation,
                );
              },
              child: const Text('Hero Animation'),
            ),
            10.ph,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.implicitanimation,
                );
              },
              child: const Text('Implicit Animation'),
            ),
            10.ph,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.lottieanimation,
                );
              },
              child: const Text('Lottie Animation'),
            ),
            10.ph,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.tweenanimation,
                );
              },
              child: const Text('Tween Color Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
