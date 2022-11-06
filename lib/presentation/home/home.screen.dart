import 'package:Dclock/infrastructure/theme/apps.color..dart';
import 'package:Dclock/infrastructure/theme/apps.text.dart';
import 'package:Dclock/infrastructure/theme/assets.image.dart';
import 'package:Dclock/presentation/home/alarm/create.alarm.page.dart';
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
        title: Obx(()=>appText.regular(
            text: controller.userName.value.isNotEmpty?'Hi, ${controller.userName.value}':'DClock',
            color: AppsColor.primaryColor,
            size: 24.0,
            weight: FontWeight.w400)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/create');
        },
        backgroundColor: AppsColor.primaryColor,
        child: const Icon(Icons.add),
      ),
      backgroundColor: AppsColor.background,
      body: Obx(()=>Container(
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
                                text: controller.dateNow.value,
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
                                text: controller.hoursAndMinute.value,
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
                                    text: controller.seconds.value,
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

                  controller.alarms.value.isNotEmpty?ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(bottom: Get.height/6),
                    children: List.generate(controller.alarms.length, (index) => Container(
                      margin:const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.06),
                                blurRadius: 5.0,
                                spreadRadius: 2.0)
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
                                  text: controller.alarms.value[index].name,
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
                    ),),
                  ):Container(
                    padding: EdgeInsets.all(16.0),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              blurRadius: 5.0,
                              spreadRadius: 10.0)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AssetsImage.NO_ALARM_ILLUST),
                        const SizedBox(height: 10.0,),
                        appText.regular(text: 'Kamu belum men-setup alarm',color: AppsColor.primaryColor,size: 16.0),
                        const SizedBox(height: 10.0,),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ))),
    );
  }
}
