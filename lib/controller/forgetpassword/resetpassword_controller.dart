import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/repassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController{
  login();
  goToSuccessResetPassword();
}
class ResetPasswordControllerImp extends   ResetPasswordController{
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  StatusRequest? statusRequest =StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  @override
  login() {}
  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    rePassword.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToSuccessResetPassword() async{
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!,password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouts.successResetPassword,);
          // Get.offNamed(AppRouts.login);
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Try Again") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

}
