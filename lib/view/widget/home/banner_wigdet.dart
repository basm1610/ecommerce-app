import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends GetView<HomeControllerImp> {
  final String title;
  final String contain;
  final String textButton;
  const BannerWidget({super.key, required this.title,required this.contain,required this.textButton,});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent.withOpacity(.6),
            ),
          ),
          Positioned(
            left: controller.lang == "ar"? 1:null,
            top: 10,
            right: controller.lang == "en"? 1:null,
            child: Image.asset(
              AppImageAsset.jacket2,
              width: 180,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 15,
              vertical:controller.lang == "en" ?15:0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(contain,
                    style: const TextStyle(
                        fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            // top: 135,
            bottom: 20,
            left: controller.lang == "en"? 30:null,
            right: controller.lang == "ar"? 30:null,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              child:  Text(
                textButton,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
