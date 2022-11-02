import 'package:Dclock/domain/core/model/alarm.model.dart';
import 'package:Dclock/domain/core/model/days.model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  var days = <DayModel>[].obs;
  var alarms = <Alarm>[].obs;
  final String boxDataNames='alarm-box';
  late Box<Alarm> box;
  @override
  void onInit() {
    _initiateDbLocal();
    _setUpDays();
    super.onInit();
  }

  _initiateDbLocal()async{
    box=await Hive.openBox<Alarm>(boxDataNames);
    ///then get the list
    await getAlarms();
  }

  Future<void>getAlarms()async{
    alarms.value=box.values.toList();
    alarms.refresh();
  }

  Future<void>addAlarm()async{
    await box.add(Alarm(name: 'test 1', time: '03:00 AM', enabled: true, days: days));
    await getAlarms();

  }

  _setUpDays() {
    var tempDays = <DayModel>[];
    tempDays.add(DayModel(name: 'Min', selected: false));
    tempDays.add(DayModel(name: 'Sen', selected: false));
    tempDays.add(DayModel(name: 'Sel', selected: false));
    tempDays.add(DayModel(name: 'Rab', selected: false));
    tempDays.add(DayModel(name: 'Kam', selected: false));
    tempDays.add(DayModel(name: 'Jum', selected: false));
    tempDays.add(DayModel(name: 'Sab', selected: false));

    days.value=tempDays;
    days.refresh();
  }

  resetDays() {
    var tempDays = <DayModel>[];
    tempDays = days.value;
    for (var element in tempDays) {
      element.selected = false;
    }

    days.value = tempDays;
  }

  selectDays(int index) {
    var tempDays = <DayModel>[];
    tempDays = days.value;
    tempDays[index].selected
        ? tempDays[index].selected = false
        : tempDays[index].selected = true;

    days.value=tempDays;
    days.refresh();

  }
}
