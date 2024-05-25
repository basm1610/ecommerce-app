
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRouts.login) ;
  }
}