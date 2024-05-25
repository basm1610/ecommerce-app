import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:ecommerce_app/data/model/coupon_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  int count = 0;
  void addCount(){
    count++;
    update();
  }
  void removeCount(){
    if(count !=0){
      count--;
      update();
    }

  }
  TextEditingController? controllerCouponApply;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List<CartModel> data = [];
  double priceTotalOrders =0.0;
  int totalCountItems = 0;
  CouponModel? couponModel;
  int discountCoupon = 0;
  String? nameCoupon ;
  String? idCoupon ;



  addCart(String itemsId)async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(myServices.sharedPreferences.getString("id")!,itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: Colors.black45,

            duration: Duration(milliseconds: 700),
            title: "اشعار", messageText: const Text("تم الاضافه الي السله",style: TextStyle(color: Colors.white),));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  deleteCart(String itemsId)async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(myServices.sharedPreferences.getString("id")!,itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: Colors.black45,

            duration: Duration(milliseconds: 700),
            title: "اشعار", messageText: const Text("تم الحذف من السله",style: TextStyle(color: Colors.white),));
      }
    }else{
      statusRequest = StatusRequest.failure;
    }
    update();

  }
  viewCart()async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartView(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if(response["datacart"]["status"] == "success"){
          List dataResponse = response["datacart"]["data"];
          Map dataResponseCountPrice = response["totalprice"];
          data.clear();
          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
          priceTotalOrders = double.parse(dataResponseCountPrice["totalprice"]);
          totalCountItems = int.parse(dataResponseCountPrice["totalcount"]);
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
    }else{
      statusRequest = StatusRequest.failure;

    }
    update();
  }
  
  checkCoupon()async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCouponApply!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String,dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = int.parse(couponModel!.couponDiscount!);
        nameCoupon = couponModel!.couponName;
        idCoupon = couponModel!.couponId;
      } else {
        discountCoupon =0;
        nameCoupon= null;
        // idCoupon= null;
        Get.snackbar("Warning", "Coupon is Invalid");
      }
    }
    update();
  }

  getTotalPrice(){
    return (priceTotalOrders - priceTotalOrders * discountCoupon /100) ;
  }
   refreshPage(){
    resetCart();
    viewCart();
  }
  resetCart(){
    totalCountItems = 0;
    priceTotalOrders = 0.0;
    data.clear();
  }
  goToCheckoutPage(){
    if(data.isEmpty) return Get.snackbar("Alert", "The cart is Empty!");
    Get.toNamed(AppRouts.checkout,arguments: {
      "idCoupon" : idCoupon ?? "0",
      "orderPrice": priceTotalOrders.toString(),
      "discountCoupon" : discountCoupon.toString(),
    });

  }
  @override
  void onInit() {
    controllerCouponApply= TextEditingController();
    viewCart();
    super.onInit();
  }
}