import 'package:ecommerce_app/controller/auth/sginup_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/core/functions/input_validate.dart';
import 'package:ecommerce_app/view/widget/login/Button_auth_widget.dart';
import 'package:ecommerce_app/view/widget/login/text_signup_widget.dart';
import 'package:ecommerce_app/view/widget/login/textfield_widget.dart';
import 'package:ecommerce_app/view/widget/login/title_and_descreption_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../widget/login/logo_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      const LogoWidget(),
                      TitleAndDescriptionWidget(
                        title: "10".tr,
                        des: "58".tr,
                      ),
                      const SizedBox(height: 20),
                      // username filed
                      TextFieldWidget(
                        valid: (val) {
                          return validInput(val!, 5, 10, "username");
                        },
                        controller: controller.userName,
                        icon: Icons.person_outline_outlined,
                        hintText: "23".tr,
                        label: "20".tr,
                      ),
                      // email filed
                      TextFieldWidget(
                        keyboardType: TextInputType.emailAddress,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        controller: controller.email,
                        icon: Icons.email_outlined,
                        hintText: "12".tr,
                        label: "18".tr,
                      ),
                      // phone filed
                      TextFieldWidget(
                        keyboardType: TextInputType.phone,
                        valid: (val) {
                          return validInput(val!, 11, 11, "phone");
                        },
                        controller: controller.phone,
                        icon: Icons.phone_android_outlined,
                        hintText: "22".tr,
                        label: "21".tr,
                      ),
                      // password filed
                      TextFieldWidget(
                        valid: (val) {
                          return validInput(val!, 5, 50, "password");
                        },
                        controller: controller.password,
                        icon: Icons.lock_outline,
                        hintText: "13".tr,
                        label: "19".tr,
                        obscureText: true,
                      ),
                      //button signUp
                      ButtonAuthWidget(
                          text: "17".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      // Row after the button signUp
                      TextSignUpWidget(
                        textOne: "25".tr,
                        textTwo: "15".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
