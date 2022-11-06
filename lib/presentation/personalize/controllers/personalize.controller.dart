import 'package:Dclock/infrastructure/dal/services/local.storage.dart';
import 'package:get/get.dart';

class PersonalizeController extends GetxController {
  var name=''.obs;

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

  void donePersonalize()async{
    prefs.setDonePersonalize();
    await Get.offNamed('/home');
  }

  void setupUserName()async{
     prefs.setUsername(name.value);
     name.value='';
     donePersonalize();
  }
}
