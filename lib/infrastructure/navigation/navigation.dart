import 'package:Dclock/infrastructure/navigation/bindings/controllers/splash.controller.binding.dart';
import 'package:Dclock/presentation/splash/splash.screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:Dclock/infrastructure/navigation/bindings/controllers/home.controller.binding.dart';
import 'package:Dclock/infrastructure/navigation/bindings/controllers/personalize.controller.binding.dart';
import 'package:Dclock/presentation/home/home.screen.dart';
import 'package:Dclock/presentation/personalize/personalize.screen.dart';

import '../../config.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;

  const EnvironmentsBadge({required this.child});

  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.PERSONALIZE,
      page: () => const PersonalizeScreen(),
      binding: PersonalizeControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
  ];
}
