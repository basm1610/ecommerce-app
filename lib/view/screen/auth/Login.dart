import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/functions/alert_exitapp.dart';
import 'package:ecommerce_app/core/functions/input_validate.dart';
import 'package:ecommerce_app/view/widget/login/Button_auth_widget.dart';
import 'package:ecommerce_app/view/widget/login/logo_widget.dart';
import 'package:ecommerce_app/view/widget/login/text_signup_widget.dart';
import 'package:ecommerce_app/view/widget/login/textfield_widget.dart';
import 'package:ecommerce_app/view/widget/login/title_and_descreption_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "9".tr,
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
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
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
                        title: "10".tr,
                        des: "11".tr,
                      ),
                      const SizedBox(height: 30),
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
                      // password filed
                      TextFieldWidget(
                        valid: (val) {
                          return validInput(val!, 5, 50, "password");
                        },
                        controller: controller.password,
                        icon: controller.isShowPassword == true
                            ? Icons.lock_outline
                            : Icons.lock_open,
                        hintText: "13".tr,
                        label: "19".tr,
                        obscureText: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                      ),
                      // TextButton forgetpassword
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      // Button signIn
                      ButtonAuthWidget(
                          text: "15".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(
                        height: 30,
                      ),
                      // Row after button signIn
                      TextSignUpWidget(
                        textOne: "16".tr,
                        textTwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
          )
          ),
        ),

    );
  }
}
