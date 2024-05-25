import 'package:ecommerce_app/controller/forgetpassword/verfiycode_controller.dart';
import 'package:ecommerce_app/controller/auth/success_signup.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/view/widget/login/Button_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/image_asset.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpImp controller = Get.put(SuccessSignUpImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "28".tr,
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
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImageAsset.success , width: 200 , height: 200),

            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "47".tr,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonAuthWidget(
                text: "31".tr,
                onPressed: () {
                  controller.goToLogin();
                }),
          ],
        ),
      ),
    );
  }
}
