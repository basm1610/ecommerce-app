import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/image_asset.dart';
import 'package:ecommerce_app/view/widget/checkout/custom_card_delivery_type.dart';
import 'package:ecommerce_app/view/widget/checkout/custom_card_payment.dart';
import 'package:ecommerce_app/view/widget/checkout/custom_card_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: MaterialButton(
            onPressed: () {
              controller.getData();
            },
            color: AppColor.primaryColor,
            child: const Text(
              "Checkout",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
      ),
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose Payment Method",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: CustomCardPayment(
                              title: "Cash",
                              isActive: controller.isPaymentMethod == "1"
                                  ? true
                                  : false,
                            ),
                            onTap: () {
                              controller.paymentMethod("1"); // 1 is cash
                            },
                          ),
                          InkWell(
                            onTap: () {
                              controller
                                  .paymentMethod("0"); // 0 is payment card
                            },
                            child: CustomCardPayment(
                                title: "Payment Method",
                                isActive: controller.isPaymentMethod == "0"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Choose Delivery Type",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: CustomCardDeliveryType(
                                imageName: AppImageAsset.delivery,
                                title: "Delivery",
                                isActive: controller.isDeliveryType == "0"
                                    ? true
                                    : false),
                            onTap: () {
                              controller.deliveryType("0"); // 0 is Delivery
                            },
                          ),
                          InkWell(
                            onTap: () {
                              controller.deliveryType("1"); // 1 is Recive
                            },
                            child: CustomCardDeliveryType(
                                imageName: AppImageAsset.driveThru,
                                title: "Revice",
                                isActive: controller.isDeliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //********Shipping Address********
                    const Text(
                      "Shipping Address",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    if (controller.isDeliveryType == "0")
                      Column(
                        children: [
                          CustomCardShippingAddress(
                              title: "Home",
                              subTitle: "Damascus Street One Building 23",
                              isActive: true),
                          CustomCardShippingAddress(
                              title: "Home",
                              subTitle: "Damascus Street One Building 23",
                              isActive: false),
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
