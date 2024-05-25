import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToLogin();
}
class SuccessResetPasswordImp extends SuccessResetPasswordController{
  @override
  goToLogin() {
  Get.offAllNamed(AppRouts.login);
  }
  
}