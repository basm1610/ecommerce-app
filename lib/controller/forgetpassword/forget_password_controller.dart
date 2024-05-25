import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/data/datasource/remote/forgetpassword/forgetpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
}
class ForgetPasswordControllerImp extends   ForgetPasswordController{
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest =StatusRequest.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());


  @override
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouts.verifyCode,arguments: {
            "email":email.text
          });
          // Get.offNamed(AppRouts.login);
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Email Not Correct") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

}
