import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/view/widget/onboarding/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar:   ButtonWidget(
        text: "Go To Cart",
        horizontal: 130,
        fontSized: 18,
        onPressed: () {
          // controller.cartController.refreshPage();
          Get.toNamed(AppRouts.myCart);
        },
      ),
      // backgroundColor: Colors.white,
     body: SafeArea(
       child: GetBuilder<ProductDetailsControllerImp>(
           builder: (controller) => HandlingDataView(
               statusRequest: controller.statusRequest,
               widget: Column(
                 children: [
                   Expanded(
                     flex: 1,
                     child: Container(

                       decoration: const BoxDecoration(
                         // color: AppColor.primaryColor,
                         borderRadius: BorderRadius.only(
                           bottomLeft: Radius.circular(15),
                           bottomRight: Radius.circular(15),
                           // topRight: Radius.circular(40),
                           // topLeft: Radius.circular(40),
                         ),
                         gradient: LinearGradient(

                           colors: [
                             Colors.red,
                             Colors.indigo
                           ]
                         )

                       ),
                       // padding: EdgeInsets.symmetric(horizontal: 10),
                       width: Get.width,
                       // height: 250,
                       child: Hero(
                         tag: "${controller.itemsModel.itemsId}",
                         child: CachedNetworkImage(
                           imageUrl:
                           "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
                           // height: 100,

                           // fit: BoxFit.cover,
                         ),
                       ),
                     ),
                   ),
                   // SizedBox(height: 15,),
                   Column(
                     children: [

                       Card(
                         elevation: 5,
                         shape: const RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(15),
                             topRight: Radius.circular(15),
                           ),

                         ),
                         child: Container(
                            height: Get.size.height/1.9,
                           decoration: BoxDecoration(
                             border: Border.all(
                               color: AppColor.primaryColor
                             ),
                             // color: Colors.white24,

                             borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(15),
                               topRight: Radius.circular(15),
                             ),
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.symmetric(
                                     horizontal: 15, vertical: 10),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       "${controller.itemsModel.itemsName}",
                                       style: const TextStyle(fontSize: 30,color: AppColor.primaryColor),
                                     ),
                                     // Spacer(),
                                     SizedBox(
                                         height: 40,
                                         // width: 70,
                                         child: Center(
                                           child: Text('\$${controller.itemsModel.itemsPriceDiscount}',
                                             style: const TextStyle(
                                                 color: AppColor.primaryColor,

                                                 fontSize: 18,
                                                 fontFamily: "sans"
                                             ),),
                                         )
                                     ),
                                     // const SizedBox(
                                     //   width: 5,
                                     // )
                                   ],
                                 ),
                               ),
                               const SizedBox(
                                 height: 10 ,
                               ),
                               Container(

                                 padding: const EdgeInsets.symmetric(
                                   horizontal: 15,
                                 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     const Text("Description:",
                                         style: TextStyle(fontSize: 30,color: AppColor.primaryColor)),
                                     const SizedBox(height: 5,),
                                     Text(
                                       " ${controller.itemsModel.itemsDesc}",
                                       maxLines: 6,


                                       style: const TextStyle(
                                           fontSize: 15,
                                           height: 1.5,
                                           wordSpacing: 1.5,


                                           color: Colors.black),
                                     ),
                                   ],
                                 ),
                               ),
                               const SizedBox(
                                 height: 25,
                               ),
                               //
                               // Padding(
                               //   padding: const EdgeInsets.symmetric(
                               //       horizontal: 15, vertical: 15),
                               //   child: Text(
                               //     "Color",
                               //     style: TextStyle(fontSize: 28),
                               //   ),
                               // ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(
                                     horizontal: 15),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     // Container(
                                     //   // padding: EdgeInsets.symmetric(horizontal: 15),
                                     //   width: Get.width * .37,
                                     //   child: Row(
                                     //     mainAxisAlignment:
                                     //     MainAxisAlignment.spaceAround,
                                     //     children: [
                                     //       CircleAvatar(
                                     //         backgroundColor: Colors.red,
                                     //         child: Container(
                                     //           decoration: BoxDecoration(
                                     //               borderRadius:
                                     //               BorderRadius.circular(
                                     //                   50),
                                     //               border: const Border(
                                     //                 bottom: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 left: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 right: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 top: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //               )),
                                     //         ),
                                     //       ),
                                     //       CircleAvatar(
                                     //         backgroundColor: Colors.black,
                                     //         child: Container(
                                     //           decoration: BoxDecoration(
                                     //               borderRadius:
                                     //               BorderRadius.circular(
                                     //                   50),
                                     //               border: const Border(
                                     //                 bottom: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 left: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 right: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 top: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //               )),
                                     //         ),
                                     //       ),
                                     //       CircleAvatar(
                                     //         backgroundColor: Colors.blue,
                                     //         child: Container(
                                     //           decoration: BoxDecoration(
                                     //               borderRadius:
                                     //               BorderRadius.circular(
                                     //                   50),
                                     //               border: const Border(
                                     //                 bottom: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 left: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 right: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //                 top: BorderSide(
                                     //                     color: Colors.white,
                                     //                     width: 4),
                                     //               )),
                                     //         ),
                                     //       ),
                                     //     ],
                                     //   ),
                                     // ),
                                     // Spacer(),
                                     Container(
                                       padding: const EdgeInsets.symmetric(
                                           horizontal: 0, vertical: 8),
                                       // decoration: BoxDecoration(
                                       //     border: Border.all(width: 1)
                                       // ),
                                       width: Get.width * .42,
                                       child: Row(
                                         mainAxisAlignment:
                                         MainAxisAlignment.spaceAround,
                                         children: [
                                           CircleAvatar(
                                             backgroundColor:
                                             AppColor.primaryColor,
                                             radius: 20,
                                             child: IconButton(
                                               onPressed: () {
                                                 controller.removeCount();
                                               },
                                               icon: const Icon(Icons.remove),
                                               color: Colors.black,
                                             ),
                                           ),
                                           CircleAvatar(
                                             radius: 25,
                                             backgroundColor:
                                             AppColor.primaryColor,
                                             child: Text(
                                               "${controller.count}",
                                               style: const TextStyle(
                                                   fontSize: 28,
                                                   fontFamily: "snas",
                                                   color: Colors.black,
                                                   fontWeight:
                                                   FontWeight.w500),
                                             ),
                                           ),
                                           CircleAvatar(
                                             backgroundColor:
                                             AppColor.primaryColor,
                                             radius: 20,
                                             child: IconButton(
                                                 onPressed: () {
                                                   controller.addCount();
                                                 },
                                                 icon: const Icon(Icons.add),
                                                 color: Colors.black),
                                           ),
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                               ),

                             ],
                           ),
                         ),
                       ),

                     ],
                   ),
                 ],
               )
           )
       ),
     ),
    );
  }
}
