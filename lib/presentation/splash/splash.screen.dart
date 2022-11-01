import 'package:Dclock/infrastructure/theme/assets.image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              AssetsImage.NIGHT_ILLUST
            )
          )
        ),
      ),
    );
  }
}
