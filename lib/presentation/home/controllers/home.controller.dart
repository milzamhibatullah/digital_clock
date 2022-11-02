import 'package:Dclock/domain/core/model/days.model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var days = <DayModel>[].obs;

  @override
  void onInit() {
    _setUpDays();
    super.onInit();
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
