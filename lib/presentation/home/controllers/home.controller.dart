import 'dart:async';

import 'package:Dclock/domain/core/model/alarm.model.dart';
import 'package:Dclock/domain/core/model/days.model.dart';
import 'package:Dclock/infrastructure/dal/services/local.storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var days = <DayModel>[].obs;
  var alarms = <Alarm>[].obs;
  final String boxDataNames = 'alarm-box';
  var hoursAndMinute = ''.obs;
  var seconds = ''.obs;
  var dateNow = ''.obs;
  final userName = ''.obs;
  var selectedDate = ''.obs;
  var vibrateOn = false.obs;
  var alarmName = ''.obs;
  var isEdit = false.obs;
  late Box<Alarm> box;

  @override
  void onInit() {
    _initiateDbLocal();
    _getCurrentTime();
    _setUpDays();
    _getUserName();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  _getCurrentTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var now = DateFormat('EEEE, dd MMMM yyyy', 'id').format(DateTime.now());
      var hours = DateTime.now().hour.toString().padLeft(2, '0');
      var minutes = DateTime.now().minute.toString().padLeft(2, '0');
      var second = DateTime.now().second.toString().padLeft(2, '0');
      dateNow.value = now;
      hoursAndMinute.value = '$hours : $minutes';
      seconds.value = second;
    });
  }

  _getUserName() async {
    var name = await prefs.getUserName();
    print('$name');
    if (name != null) {
      userName.value = name.toString();
    }
  }

  _initiateDbLocal() async {
    box = await Hive.openBox<Alarm>(boxDataNames);

    ///then get the list
    await getAlarms();
  }

  Future<void> getAlarms() async {
    alarms.value = box.values.toList();
    alarms.refresh();
  }

  Future<void> addAlarm() async {
    var tempdays=<DayModel>[];
    if(days.value.where((element) => element.selected==false).length==days.value.length){
      days.value.forEach((element) {element.selected=true;});
    }

    tempdays=days;
    await box.add(Alarm(
        name: alarmName.value.isEmpty
            ? 'Alarm ${alarms.value.length + 1}'
            : alarmName.value,
        time: selectedDate.value.isEmpty
            ? DateTime.now().toString()
            : selectedDate.value,
        vibrateOn: vibrateOn.value,
        enabled: true,
        days: tempdays));
    await getAlarms();
  }

  _setUpDays() {
    var tempDays = <DayModel>[];
    var daily = DateFormat.EEEE('id').dateSymbols.STANDALONEWEEKDAYS;
    for (var d in daily) {
      tempDays.add(DayModel(name: d.substring(0,3).capitalizeFirst.toString(), selected: false));
    }
    days.value = tempDays;
    days.refresh();
  }

  resetDays() {
    var tempDays = <DayModel>[];
    tempDays = days.value;
    for (var element in tempDays) {
      element.selected = false;
    }
    isEdit.value=false;
    selectedDate.value = '';
    vibrateOn.value = false;
    alarmName.value = '';
    editedIndex.value=0;
    days.value = tempDays;
  }

  selectDays(int index) {
    var tempDays = <DayModel>[];
    tempDays = days.value;
    tempDays[index].selected
        ? tempDays[index].selected = false
        : tempDays[index].selected = true;

    days.value = tempDays;
    days.refresh();
  }

  void changeEnableAlarm(int index, bool value) async {
    await box.putAt(
      index,
      Alarm(
          name: alarms.value[index].name,
          time: alarms.value[index].time,
          enabled: value,
          vibrateOn: alarms.value[index].vibrateOn,
          days: alarms.value[index].days),
    );
    await getAlarms();
  }

  ///edited index
  var editedIndex=0.obs;
  void setupEdit(index) {
    isEdit.value=true;
    editedIndex.value=index;
    alarmName.value=alarms.value[index].name!;
    selectedDate.value= alarms.value[index].time!;
    vibrateOn.value=alarms.value[index].vibrateOn!;
  }

  deletAlarm()async {
    await box.deleteAt(editedIndex.value);
    await getAlarms();
  }
}
