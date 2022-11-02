import 'package:Dclock/infrastructure/theme/apps.color..dart';
import 'package:Dclock/infrastructure/theme/apps.text.dart';
import 'package:Dclock/infrastructure/theme/assets.image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: appText.regular(
            text: 'DClock',
            color: AppsColor.primaryColor,
            size: 24.0,
            weight: FontWeight.w400),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppsColor.primaryColor,
        child: const Icon(Icons.add),
      ),
      backgroundColor: AppsColor.background,
      body: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),

                  ///now time section
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              blurRadius: 5.0,
                              spreadRadius: 10.0)
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///date section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10.0,
                              color: AppsColor.primaryColor,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            appText.title(
                                text: 'Senin, 2 November 2022',
                                color: Colors.black26,
                                size: 10.0)
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText.regular(
                                text: '03:00',
                                color: AppsColor.primaryColor,
                                size: 68.0,
                                weight: FontWeight.w200),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.vertical,
                              children: [
                                const SizedBox(
                                  height: 6.0,
                                ),
                                appText.regular(
                                    text: '23',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                appText.regular(
                                    text: 'PM',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  appText.title(
                      text: 'Alarm', color: AppsColor.primaryColor, size: 20),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              blurRadius: 5.0,
                              spreadRadius: 10.0)
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///date section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10.0,
                              color: AppsColor.primaryColor,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            appText.title(
                                text: 'Hari ini',
                                color: Colors.black26,
                                size: 10.0)
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText.regular(
                                text: '03:00',
                                color: AppsColor.primaryColor,
                                size: 68.0,
                                weight: FontWeight.w200),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.vertical,
                              children: [
                                const SizedBox(
                                  height: 6.0,
                                ),
                                appText.regular(
                                    text: '23',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                appText.regular(
                                    text: 'PM',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 1.0,
                              ),
                            ),
                            CupertinoSwitch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: AppsColor.primaryColor,
                              trackColor: AppsColor.background,
                              thumbColor: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              blurRadius: 5.0,
                              spreadRadius: 10.0)
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///date section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10.0,
                              color: AppsColor.primaryColor,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            appText.title(
                                text: 'Hari ini',
                                color: Colors.black26,
                                size: 10.0)
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText.regular(
                                text: '03:00',
                                color: AppsColor.primaryColor,
                                size: 68.0,
                                weight: FontWeight.w200),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.vertical,
                              children: [
                                const SizedBox(
                                  height: 6.0,
                                ),
                                appText.regular(
                                    text: '23',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                appText.regular(
                                    text: 'PM',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 1.0,
                              ),
                            ),
                            CupertinoSwitch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: AppsColor.primaryColor,
                              trackColor: AppsColor.background,
                              thumbColor: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              blurRadius: 5.0,
                              spreadRadius: 10.0)
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///date section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10.0,
                              color: AppsColor.primaryColor,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            appText.title(
                                text: 'Sen, Selasa, Rabu',
                                color: Colors.black26,
                                size: 10.0)
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText.regular(
                                text: '03:00',
                                color: AppsColor.primaryColor,
                                size: 68.0,
                                weight: FontWeight.w200),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.vertical,
                              children: [
                                const SizedBox(
                                  height: 6.0,
                                ),
                                appText.regular(
                                    text: '23',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                appText.regular(
                                    text: 'PM',
                                    size: 24.0,
                                    color: AppsColor.primaryColor,
                                    weight: FontWeight.w300),
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 1.0,
                              ),
                            ),
                            CupertinoSwitch(
                              value: false,
                              onChanged: (value) {},
                              activeColor: AppsColor.primaryColor,
                              trackColor: AppsColor.background,
                              thumbColor: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
