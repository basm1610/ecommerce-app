import 'package:ecommerce_app/controller/forgetpassword/forget_password_controller.dart';
import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/functions/input_validate.dart';
import 'package:ecommerce_app/view/widget/login/Button_auth_widget.dart';
import 'package:ecommerce_app/view/widget/login/text_signup_widget.dart';
import 'package:ecommerce_app/view/widget/login/textfield_widget.dart';
import 'package:ecommerce_app/view/widget/login/title_and_descreption_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/login/logo_widget.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "14".tr,
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
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: ((controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formState,
                  child: ListView(
                    children: [
                      // logo image
                      const LogoWidget(),
                      // description
                      TitleAndDescriptionWidget(
                        title: "27".tr,
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
                      // Button check
                      ButtonAuthWidget(
                          text: "30".tr,
                          onPressed: () {
                            controller.checkEmail();
                          }),
                    ],
                  ),
                ),
              )))),
    );
  }
}
