import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/view/widget/home/banner_wigdet.dart';
import 'package:ecommerce_app/view/widget/home/categories_items.dart';
import 'package:ecommerce_app/view/widget/home/product_items.dart';
import 'package:ecommerce_app/view/widget/home/title_big_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 1,
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          title: Text(
            "59".tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_on_rounded,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRouts.search);
                },
                icon: const Icon(Icons.search_sharp)),
            IconButton(
                onPressed: () {
                  Get.toNamed(AppRouts.myFavorite);
                },
                icon: const Icon(Icons.favorite_outline_sharp)),
          ],
        ),
        body: GetBuilder<HomeControllerImp>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                shrinkWrap: true,
                children: [
                  BannerWidget(
                      title: "60".tr, contain: "61".tr, textButton: "62".tr),
                  BigTitleWidget(text: "63".tr),
                  const CategoriesItem(),
                  BigTitleWidget(text: "64".tr),
                  const ProductItems()
                ],
              ));
        }));
  }
}
