import 'package:ecommerce_app/controller/forgetpassword/success_resetpassword_controller.dart';
import 'package:ecommerce_app/controller/forgetpassword/verfiycode_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/view/widget/login/Button_auth_widget.dart';
import 'package:ecommerce_app/view/widget/onboarding/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordImp controller = Get.put(SuccessResetPasswordImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "42".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 150),
          children:  [
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Lottie.asset(AppImageAsset.success , width: 200 , height: 200),
               Text("32".tr,style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 50),),
               ButtonAuthWidget(text: "31".tr, onPressed: (){
                controller.goToLogin();
               }
               ),
             ],
           )
          ],
        ),
      ),

    );
  }
}
