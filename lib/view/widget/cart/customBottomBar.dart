import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/view/widget/cart/customButtonCoupon.dart';
import 'package:ecommerce_app/view/widget/onboarding/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends GetView<CartController> {
  final String price;
  final String discount;
  final String totalPrice;
  final TextEditingController controllerCoupon;
  final void Function()? onApply;

  const CustomBottomBar(
      {super.key,
      required this.price,
      required this.discount,
      required this.controllerCoupon,
      required this.onApply,
      required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
          builder: (controller) => controller.nameCoupon == null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          cursorColor: AppColor.primaryColor,
                          controller: controllerCoupon,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColor.primaryColor)),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              hintText: "Coupon Code"),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            onPressed: onApply,
                            text: "apply",
                            fontSized: 20,
                          ))
                    ],
                  ),
                )
              : Text(
                "Coupon Code is (${controller.nameCoupon})",
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        Container(
          decoration: BoxDecoration(
              // color: Colors.grey[200],

              border: Border.all(color: AppColor.primaryColor, width: .5),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          height: Get.height / 4.6,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Price"),
                    Text("$price \$"),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   child: Divider(
              //     color: Colors.black,
              //   ),
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Coupon"),
                    Text("$discount%"),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Price"),
                    Text("$totalPrice\$"),
                  ],
                ),
              ),
            ],
          ),
        ),
        ButtonWidget(
          text: "Check Out",
          fontSized: 20,
          horizontal: 110,
          onPressed: () {controller.goToCheckoutPage();},
        ),
      ],
    );
  }
}
