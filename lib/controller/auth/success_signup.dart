import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:get/get.dart';

abstract class SuccessSignUp extends GetxController{
  goToLogin();
}
class SuccessSignUpImp extends   SuccessSignUp{

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRouts.login);
  }

}
