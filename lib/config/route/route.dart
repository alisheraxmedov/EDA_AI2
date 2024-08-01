import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:unavialable/presentation/pages/home.dart';
import 'package:unavialable/presentation/pages/onboarding/basic.dart';
import 'package:unavialable/presentation/pages/onboarding/camera.dart';
import 'package:unavialable/presentation/pages/onboarding/galery.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ShimmerScreen.routeName:
      return MaterialPageRoute(
        builder: (contex) => const ShimmerScreen(),
      );
    case GateScreen.routeName:
      return MaterialPageRoute(
        builder: (contex) => const GateScreen(),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (contex) => const HomePage(),
      );
    case BasicScreen.routeName:
      return MaterialPageRoute(
        builder: (contex) => const BasicScreen(),
      );
    case SinovScreen.routeName:
      return MaterialPageRoute(
        builder: (contex) => const SinovScreen(),
      );
    case FromGaleryScreen.routeName:
      return MaterialPageRoute(
        builder: (contex) => const FromGaleryScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (contex) => Scaffold(
          body: Center(
            child: Text(
              "not_found".tr(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      );
  }
}
