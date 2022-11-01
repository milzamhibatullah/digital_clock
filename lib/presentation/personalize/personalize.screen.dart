import 'package:Dclock/infrastructure/theme/apps.text.dart';
import 'package:Dclock/infrastructure/theme/assets.image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/personalize.controller.dart';

class PersonalizeScreen extends GetView<PersonalizeController> {
  const PersonalizeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsImage.AFTERNOON_ILLUST))),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    controller.skipPersonalize();
                  },
                  child: appText.title(text: 'SKIP', color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: Get.height / 2.5,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(26.0)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                            color: Colors.black.withOpacity(0.08))
                      ],
                      color: const Color(0xFFFFE3E1)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      appText.title(
                          text: 'Personalisasi',
                          color: Colors.black,
                          size: 20.0),
                      const SizedBox(
                        height: 10.0,
                      ),
                      appText.regular(
                          text: 'Kami ingin mengenalmu lebih dekat',
                          color: Colors.black,
                          size: 16.0),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Nama kamu ...',
                            hintStyle: appText.styles(size: 14.0,color: Colors.black38),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: (){
                          controller.skipPersonalize();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width, 56.0),
                          backgroundColor: const Color(0xFFFF9494),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        ),
                        child: appText.title(
                            text: 'Selanjutnya', color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
