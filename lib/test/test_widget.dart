import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:imageview360/imageview360.dart';


class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {

  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = false;
  int rotationCount = 100;
  int swipeSensitivity = 4;
  bool allowSwipeToRotate = true;
  bool imagePrecached = true;

  @override
  void initState() {
    super.initState();
    updateImageList(context);
  }

  void updateImageList(BuildContext context) {
    for (int i = 1; i <= 21; i++) {
      imageList.add(AssetImage(AppImageAsset.s2));
    }
  }

  @override
  Widget build(BuildContext context) {


    // Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: Text("Title")),
       body:  SingleChildScrollView(
      child: Container(
      color: Colors.white,
      child: Column(
        children: [
      Container(
      height: MediaQuery.of(context).size.width ,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Image.asset(AppImageAsset.s2),
                )),
            ImageView360(
              key: UniqueKey(),
              imageList: imageList,
              autoRotate: autoRotate,
              rotationCount: rotationCount,
              swipeSensitivity: swipeSensitivity,
              allowSwipeToRotate: allowSwipeToRotate,
              onImageIndexChanged: (currentImageIndex) {
                print("currentImageIndex: $currentImageIndex");
              },
            ),
          ],
        ),
      ),

      // GetBuilder<TestController>(builder: (controller) {
      //   if (controller.statusRequest == StatusRequest.loading) {
      //     return   Center(child: Lottie.asset(AppImageAsset.loading , width: 250 , height: 250) );
      //   } else if (controller.statusRequest == StatusRequest.offlineFailure) {
      //     return  Center(child: Lottie.asset(AppImageAsset.offline , width: 250 , height: 250));
      //   } else if (controller.statusRequest == StatusRequest.serverFailure) {
      //     return  Center(child: Lottie.asset(AppImageAsset.server , width: 250 , height: 250));
      //   } else {
      //     return ListView.builder(
      //         itemCount: controller.data.length,
      //         itemBuilder: (context, index) {
      //           return Text("${controller.data}");
      //         });
      //   }
      // }),
      ]
       )
    )
    )
    );
  }
}