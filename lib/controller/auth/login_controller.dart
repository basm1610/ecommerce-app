import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();

  signInWithGoogle();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late Crud crud = Crud();
  bool isShowPassword = true;
  StatusRequest? statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  showPassword(){
    isShowPassword = isShowPassword==true ?false :true;
    update();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRouts.forgetPassword);
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRouts.signUp);
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(password.text, email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("id", response['data']['user_id']);
          myServices.sharedPreferences.setString("username", response['data']['users_name']);
          myServices.sharedPreferences.setString("email", response['data']['users_email']);
          myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");
          // data.addAll(response['data']);
          Get.offNamed(AppRouts.home);
          // Get.offNamed(AppRouts.login);
        } else {
          Get.defaultDialog(title: "ُWarning" , middleText: "Email Or Password Not Correct") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signInWithGoogle() async {
    final GoogleSignInAccount? _googleUser = await googleSignIn.signIn();
    print(_googleUser);
  }
}
