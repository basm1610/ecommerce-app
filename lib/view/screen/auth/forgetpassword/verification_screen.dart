import 'package:ecommerce_app/controller/auth/verfiycode_signup_controller.dart';
import 'package:ecommerce_app/controller/forgetpassword/verfiycode_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/view/widget/login/logo_widget.dart';
import 'package:ecommerce_app/view/widget/login/title_and_descreption_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class VerificationScreenRePassword extends StatelessWidget {
  const VerificationScreenRePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "43".tr,
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
      body: GetBuilder<VerifyCodeControllerImp>(builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget:   Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                const LogoWidget(),
                TitleAndDescriptionWidget(
                  title: "44".tr,
                  des:
                  "45".tr,
                ),
                const SizedBox(height: 30),
                Container(
                  child: OtpTextField(
                    fieldWidth: 50,
                    focusedBorderColor: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 5,
                    borderColor: Color(0xFF512DA8),
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode){
                      controller.goToResetPassword(verificationCode);

                    }, // end onSubmit
                  ),
                ),



              ],
            ),
          )
      )


    ),
    );
  }
}
