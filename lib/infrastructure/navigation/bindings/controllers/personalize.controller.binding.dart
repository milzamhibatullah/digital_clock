import 'package:get/get.dart';

import '../../../../presentation/personalize/controllers/personalize.controller.dart';

class PersonalizeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PersonalizeController());
  }
}
