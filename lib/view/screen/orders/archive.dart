import 'package:ecommerce_app/controller/orders/orders_archived_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchivedController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchivedController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardOrder(ordersModel: controller.data[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardOrder extends GetView<OrdersArchivedController> {
  final OrdersModel ordersModel;

  const CardOrder({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Number : #${ordersModel.ordersId}",
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
                "Order Type : ${controller.printOrderType(ordersModel.ordersType!)}"),
            Text("Order Price : ${ordersModel.ordersPrice} \$"),
            Text("Delivery Price : ${ordersModel.ordersPriceDelivery} \$"),
            Text(
                "Coupon  : ${controller.printOrderCoupon(ordersModel.ordersCoupon!)} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(ordersModel.ordersPaymentMethod!)}"),
            Text(
                "Order Status : ${controller.printOrderStatus(ordersModel.ordersStatus!)}"),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Price : ${ordersModel.ordersTotalprice} \$"),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRouts.orderDetails, arguments: {
                      "orderDetails": ordersModel,
                    });
                  },
                  color: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:const  Text("Details"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
