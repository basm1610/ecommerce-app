import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{
  intialData();
}
class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());

  late ItemsModel itemsModel;
  int count = 0;
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();

  intialData() async{
    statusRequest= StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    count = await countItems(itemsModel.itemsId!);
    statusRequest= StatusRequest.success;
    update();
  }
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
            title: "اشعار", messageText:  const Text("تم الاضافه الي السله",style: TextStyle(color: Colors.white),));
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
  countItems(String itemsId)async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.countItems(myServices.sharedPreferences.getString("id")!,itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int count=0;
        count = int.parse(response["data"]);
        print("=========================");
        print(count);
        return count;
      }
    }else{
      statusRequest = StatusRequest.failure;
    }
  }
  void addCount(){
    addCart(itemsModel.itemsId!);
    count++;
    update();
  }
  void removeCount(){
    deleteCart(itemsModel.itemsId!);
    if(count !=0){
      count--;
      update();
    }

  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];


  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}