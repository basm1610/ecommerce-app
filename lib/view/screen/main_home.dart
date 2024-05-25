
import 'dart:io';
import 'package:ecommerce_app/controller/mainHome_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/view/widget/home/bottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeControllerImp());
    return GetBuilder<MainHomeControllerImp>(builder: ((controller) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRouts.myCart);
            },
            backgroundColor: AppColor.primaryColor,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: const BottomAppBarWidget(),
          // ignore: deprecated_member_use
          body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentIndex),
              onWillPop: () {
                Get.defaultDialog(
                    title: "Warning",
                    titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    buttonColor: AppColor.primaryColor,
                    contentPadding: const EdgeInsets.all(15),
                    middleText: "Are you want to Exit App",
                    onCancel: () {},
                    onConfirm: () {
                      exit(0);
                    });
                return Future.value(false);
              }
              )
              );
    }));
  }
}
