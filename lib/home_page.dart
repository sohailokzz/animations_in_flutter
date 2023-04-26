import 'package:animation_in_flutter/spacing.dart';
import 'package:flutter/material.dart';

import 'common/reusable_button.dart';
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
            ReusableButton(
              buttonTitle: 'Hero Animation',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.heroanimation,
                );
              },
            ),
            12.ph,
            ReusableButton(
              buttonTitle: 'Implicit Animation',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.implicitanimation,
                );
              },
            ),
            12.ph,
            ReusableButton(
              buttonTitle: 'Lottie Animation',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.lottieanimation,
                );
              },
            ),
            12.ph,
            ReusableButton(
              buttonTitle: 'Tween Color Animation',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.tweenanimation,
                );
              },
            ),
            12.ph,
            ReusableButton(
              buttonTitle: 'Chained Animation',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.chainedanimation,
                );
              },
            ),
            12.ph,
            ReusableButton(
              buttonTitle: '3D Animation',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.threedanimation,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
