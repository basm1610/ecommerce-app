import 'package:ecommerce_app/controller/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/functions/input_validate.dart';
import 'package:ecommerce_app/view/widget/login/Button_auth_widget.dart';
import 'package:ecommerce_app/view/widget/login/logo_widget.dart';
import 'package:ecommerce_app/view/widget/login/textfield_widget.dart';
import 'package:ecommerce_app/view/widget/login/title_and_descreption_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "39".tr,
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
      body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
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
                        title: "35".tr,
                        des: "34".tr,
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        valid: (val) {
                          return validInput(val!, 5, 50, "password");
                        },
                        controller: controller.password,
                        icon: Icons.lock_outline,
                        hintText: "40".tr,
                        label: "19".tr,
                        obscureText: true,
                      ),
                      TextFieldWidget(
                        valid: (val) {
                          return validInput(val!, 5, 50, "password");
                        },
                        controller: controller.rePassword,
                        icon: Icons.lock_outline,
                        hintText: "41".tr,
                        label: "46".tr,
                        obscureText: true,
                      ),
                      ButtonAuthWidget(
                          text: "33".tr,
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          }),
                    ],
                  ),
                ),
              ))),
    );
  }
}
