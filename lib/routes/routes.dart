import 'package:animation_in_flutter/examples/chained_animation.dart';
import 'package:animation_in_flutter/examples/hero_animation.dart';
import 'package:animation_in_flutter/examples/implicit_animation.dart';
import 'package:animation_in_flutter/examples/lottie_animation.dart';
import 'package:animation_in_flutter/examples/tween_color_animation.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import 'routes_name.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homepage:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        );

      case RoutesName.heroanimation:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HerooAnimation(),
        );

      case RoutesName.implicitanimation:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ImplicitAnimations(),
        );

      case RoutesName.lottieanimation:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LottieAnimation(),
        );

      case RoutesName.tweenanimation:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TweenColorAnimation(),
        );

      case RoutesName.chainedanimation:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChainedAnimation(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Selected'),
              ),
            );
          },
        );
    }
  }
}
