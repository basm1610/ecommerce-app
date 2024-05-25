import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/cart/customBottomBar.dart';
import 'package:ecommerce_app/view/widget/cart/customCardList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller)=>CustomBottomBar(
        controllerCoupon: controller.controllerCouponApply! ,
        onApply: (){
          controller.checkCoupon();
        },
        price: "${cartController.priceTotalOrders}",
        discount: '${controller.discountCoupon}',
        totalPrice: '${controller.getTotalPrice()}',
      ),),
      appBar: AppBar(
        elevation: 2,
        titleSpacing: 1,
        centerTitle: true,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<CartController>(
          builder: (controller) =>
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      ...List.generate(
                          controller.data.length,
                              (index) =>
                              CustomCardList(
                                onAdd: () async{
                                await controller.addCart(controller.data[index].itemsId!);
                                controller.refreshPage();
                                },
                                onRemove: () async{
                                  await cartController.deleteCart(controller.data[index].itemsId!);
                                  controller.refreshPage();
                                },
                                title: "${controller.data[index].itemsName}",
                                subtitle: "${controller.data[index]
                                    .itemsprice}",
                                count: '${controller.data[index].countitems}',
                                image: '${controller.data[index].itemsImage}',
                              ))
                    ],
                  ))),
    );
  }
}
