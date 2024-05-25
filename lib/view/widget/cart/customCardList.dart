import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardList extends StatelessWidget {
  final String title;
  final String subtitle;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomCardList({super.key, required this.title, required this.subtitle, required this.count, required this.image,required this.onAdd,required this.onRemove});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        child: GetBuilder<CartController>(builder: (controller)=>Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage( imageUrl: '${AppLink.imageItems}/$image',height: 80,),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(title),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    Text("$subtitle\$",style: const TextStyle(fontSize: 18,color: AppColor.primaryColor,fontFamily: "sans")),
                    const SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                      width: Get.width * .37,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColor.primaryColor,
                            radius: 20,
                            child: IconButton(
                                onPressed:onRemove,
                                icon: const Icon(Icons.remove),color: Colors.black),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColor.primaryColor,
                            child: Text(
                              count,
                              style: const TextStyle(
                                fontSize: 28, fontFamily: "snas",color: Colors.black,fontWeight: FontWeight.w500,),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: AppColor.primaryColor,
                            radius: 20,
                            child: IconButton(
                                onPressed: onAdd,
                                icon: const Icon(Icons.add),color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
