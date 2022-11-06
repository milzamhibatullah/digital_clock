import 'package:Dclock/infrastructure/dal/services/local.storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('test');

  }

  @override
  void onReady() {
    super.onReady();
    _nextScreen();

  }

  @override
  void onClose() {
    super.onClose();
  }

  _nextScreen(){
    Future.delayed(const Duration(seconds: 1,milliseconds: 500),()async{
      if(await prefs.getDonePersonalize()=='true'){
        Get.offNamed('/home');
      }else{
        Get.offNamed('/personalize');
      }
    });
  }
}
