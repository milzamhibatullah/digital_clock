import 'package:Dclock/infrastructure/dal/services/local.storage.dart';
import 'package:get/get.dart';

class PersonalizeController extends GetxController {
  //TODO: Implement PersonalizeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void skipPersonalize()async{
    prefs.setIsSkip();
    await Get.offNamed('/home');
  }
}