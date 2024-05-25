import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 30,),
            MaterialButton(
              onPressed: () {
                controller.changeLange("ar");
                Get.toNamed(AppRouts.onBoarding);

              },
              color: AppColor.primaryColor,
              child: const Text("Ar",style: TextStyle(fontSize: 20),),
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              onPressed: () {
                controller.changeLange("en");
                Get.toNamed(AppRouts.onBoarding);

              },
              color: AppColor.primaryColor,
              child: const Text("En",style: TextStyle(fontSize: 20),),
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}
