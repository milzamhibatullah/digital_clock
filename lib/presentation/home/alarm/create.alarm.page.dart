import 'package:Dclock/infrastructure/theme/apps.color..dart';
import 'package:Dclock/infrastructure/theme/apps.text.dart';
import 'package:Dclock/presentation/home/controllers/home.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAlarmPage extends GetView<HomeController> {
  const CreateAlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          controller.resetDays();
          return Future.value(true);
        },
        child: Obx(() => Scaffold(
              backgroundColor: Colors.white,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0.0,
                iconTheme: IconThemeData(color: AppsColor.primaryColor),
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: appText.regular(
                  text: 'Tambahkan Alarm',
                  color: AppsColor.primaryColor,
                  weight: FontWeight.w700,
                  size: 16.0,
                ),
                actions: [
                  controller.isEdit.value
                      ? IconButton(
                          onPressed: () async {
                            await controller.deletAlarm();
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: AppsColor.primaryColor,
                          ))
                      : const SizedBox(
                          height: 0.0,
                          width: 0.0,
                        )
                ],
              ),
              bottomNavigationBar: SizedBox(
                height: 60,
                child: Material(
                  color: AppsColor.primaryColor,
                  child: InkWell(
                    onTap: () async {
                      // await controller.addAlarm();
                      // Get.back();
                      await controller.addAlarm();
                      Get.back();
                    },
                    onLongPress: () {},
                    splashColor: Colors.purple.withOpacity(0.5),
                    highlightColor: Colors.purple.withOpacity(0.5),
                    splashFactory: InkRipple.splashFactory,
                    child: Center(
                      child: appText.title(
                          text: controller.isEdit.value ? 'Ubah' : 'Simpan',
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      //time picker
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.06),
                                    blurRadius: 5.0,
                                    spreadRadius: 10.0)
                              ]),
                          height: Get.height / 3,
                          width: Get.width / 1.15,
                          child: CupertinoTheme(
                            data: CupertinoThemeData(
                                textTheme: CupertinoTextThemeData(
                                    dateTimePickerTextStyle: appText.styles(
                                        color: AppsColor.primaryColor,
                                        size: 20.0,
                                        weigth: FontWeight.w500))),
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: controller.isEdit.value &&
                                      controller.selectedDate.isNotEmpty
                                  ? DateTime.parse(
                                      controller.selectedDate.value)
                                  : DateTime.now(),
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime value) {
                                controller.selectedDate.value =
                                    value.toString();
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),

                      /// list of days repeat
                      SizedBox(
                        height: 60.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(4.0),
                          children: List.generate(
                            controller.days.value.length,
                            (index) => GestureDetector(
                              onTap: () {
                                controller.selectDays(index);
                              },
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                width: 65.0,
                                padding: const EdgeInsets.all(10.0),
                                margin: EdgeInsets.only(
                                    left: index == 0 ? 26.0 : 16.0,
                                    right: index == 7 - 1 ? 20.0 : 0.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: controller
                                                .days.value[index].selected
                                            ? AppsColor.primaryColor
                                                .withOpacity(0.8)
                                            : Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.08),
                                          blurRadius: 2.0,
                                          spreadRadius: 2.0)
                                    ]),
                                child: Center(
                                  child: appText.title(
                                      text: controller.days.value[index].name,
                                      color: index == 0
                                          ? Colors.redAccent.withOpacity(0.5)
                                          : AppsColor.primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),

                      ///alarm name input
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 26.0),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            appText.title(
                                text: 'Nama Alarm',
                                color: AppsColor.primaryColor),
                            TextFormField(
                              style: appText.styles(),
                              onChanged: (value) {
                                controller.alarmName.value = value;
                              },
                              decoration: InputDecoration(
                                  hintText: controller.isEdit.value
                                      ? controller.alarmName.value
                                      : 'Input nama alarm',
                                  hintStyle: appText.styles(
                                      color: Colors.black38,
                                      weigth: FontWeight.normal),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      ///vibration switch
                      Container(
                        margin: const EdgeInsets.only(left: 36.0, right: 26.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: appText.title(
                                  text: 'Mode Getar',
                                  color: AppsColor.primaryColor),
                            ),
                            CupertinoSwitch(
                              value: controller.vibrateOn.value,
                              onChanged: (value) {
                                controller.vibrateOn.value = value;
                              },
                              activeColor: AppsColor.primaryColor,
                              trackColor: AppsColor.background,
                              thumbColor: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
